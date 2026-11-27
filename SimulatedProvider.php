<?php
/**
 * SimulatedProvider - DEVELOPMENT AND TESTING ONLY. This is NOT real fingerprint recognition.
 *
 * How the simulation works:
 *  - Every simulated "finger" has a secret identity string, e.g. "student:12:R_INDEX".
 *  - From that identity a fixed 64-number feature vector is derived (like the minutiae of a real finger).
 *  - Each simulated capture adds random noise, so two scans of the same finger are similar but never identical,
 *    exactly like real scans.
 *  - Matching uses cosine similarity scaled to 0-100. Same finger ~ 95-99, different fingers ~ 0-35.
 * This lets every part of the system (enrolment, identification, threshold, rejection, duplicates)
 * be tested before a real scanner is connected.
 */
declare(strict_types=1);

final class SimulatedProvider implements BiometricProvider
{
    public const FORMAT = 'BSAMS-SIM-1';
    private const DIM = 64;

    public function name(): string { return 'simulated'; }

    public function isSimulated(): bool { return true; }

    /** The virtual scanner: produce a capture for a simulated finger identity. */
    public static function capture(string $fingerIdentity, bool $poorQuality = false): array
    {
        $base = self::baseVector($fingerIdentity);
        $sigma = $poorQuality ? 0.9 : 0.15;
        $v = [];
        foreach ($base as $x) {
            $v[] = round($x + self::gauss() * $sigma, 4);
        }
        $quality = $poorQuality ? random_int(15, 40) : random_int(62, 96);
        return ['template' => json_encode(['fmt' => self::FORMAT, 'v' => $v]), 'quality' => $quality];
    }

    /** Deterministic base vector for a finger identity (values between -1 and 1). */
    private static function baseVector(string $identity): array
    {
        $v = [];
        $secret = (string)config('sim_secret');
        for ($i = 0; count($v) < self::DIM; $i++) {
            $bytes = hash_hmac('sha256', $identity . '#' . $i, $secret, true);
            foreach (unpack('n*', $bytes) as $n) {          // 16 numbers per hash
                $v[] = ($n / 32767.5) - 1.0;
                if (count($v) === self::DIM) break;
            }
        }
        return $v;
    }

    private static function gauss(): float
    {
        $u = max(1e-9, mt_rand() / mt_getrandmax());
        $w = mt_rand() / mt_getrandmax();
        return sqrt(-2 * log($u)) * cos(2 * M_PI * $w);
    }

    private static function vector(string $template): array
    {
        $d = json_decode($template, true);
        if (!is_array($d) || ($d['fmt'] ?? '') !== self::FORMAT || !is_array($d['v'] ?? null) || count($d['v']) !== self::DIM) {
            throw new InvalidArgumentException('Not a valid simulated fingerprint template.');
        }
        return array_map(static function ($x) {
            if (!is_int($x) && !is_float($x)) throw new InvalidArgumentException('Template contains invalid values.');
            return (float)$x;
        }, $d['v']);
    }

    public function prepareTemplate(string $captured): string
    {
        return json_encode(['fmt' => self::FORMAT, 'v' => self::vector($captured)]);
    }

    public static function similarity(string $a, string $b): float
    {
        $x = self::vector($a);
        $y = self::vector($b);
        $dot = $nx = $ny = 0.0;
        for ($i = 0; $i < self::DIM; $i++) {
            $dot += $x[$i] * $y[$i];
            $nx += $x[$i] ** 2;
            $ny += $y[$i] ** 2;
        }
        if ($nx == 0.0 || $ny == 0.0) return 0.0;
        return round(max(0.0, $dot / (sqrt($nx) * sqrt($ny))) * 100, 2);
    }

    public function identify(string $probe, array $candidates): array
    {
        $best = ['id' => null, 'score' => 0.0];
        foreach ($candidates as $c) {
            $s = self::similarity($probe, $c['template']);
            if ($s > $best['score']) $best = ['id' => (int)$c['id'], 'score' => $s];
        }
        return $best;
    }

    public function status(): array
    {
        return ['ok' => true, 'message' => 'Simulated scanner active (development/testing mode – not real biometric verification).'];
    }
}
