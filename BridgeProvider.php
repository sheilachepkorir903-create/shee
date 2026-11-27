<?php
/**
 * BridgeProvider - REAL HARDWARE driver.
 *
 * Talks to the local "biometric bridge" service running on the attendance computer
 * (default http://127.0.0.1:8765). The bridge wraps the scanner vendor's SDK.
 * Contract (JSON over HTTP, see bridge/README.md):
 *   GET  /status   -> {"ok":true,"device":"<model>","sdk":"<name/version>"}
 *   POST /capture  -> {"ok":true,"template":"<base64>","quality":0-100,"format":"<vendor/ISO>"}   (called by the browser)
 *   POST /match    {"probe":"<base64>","candidates":[{"id":1,"template":"<base64>"}]}
 *                  -> {"ok":true,"bestId":1|null,"score":0-100}                                      (called by PHP)
 */
declare(strict_types=1);

final class BridgeProvider implements BiometricProvider
{
    public function __construct(private string $baseUrl)
    {
        // Only allow the loopback address so templates never leave the attendance computer.
        $host = parse_url($baseUrl, PHP_URL_HOST);
        if (!in_array($host, ['127.0.0.1', 'localhost', '::1'], true)) {
            throw new InvalidArgumentException('Bridge URL must point to 127.0.0.1 (local service).');
        }
    }

    public function name(): string { return 'hardware'; }

    public function isSimulated(): bool { return false; }

    public function prepareTemplate(string $captured): string
    {
        $bin = base64_decode($captured, true);
        if ($bin === false || strlen($bin) < 64 || strlen($bin) > 16384) {
            throw new InvalidArgumentException('Scanner returned an invalid template.');
        }
        return base64_encode($bin);
    }

    public function identify(string $probe, array $candidates): array
    {
        if (!$candidates) return ['id' => null, 'score' => 0.0];
        $res = $this->call('POST', '/match', ['probe' => $probe, 'candidates' => array_values($candidates)]);
        if (empty($res['ok'])) {
            throw new RuntimeException('Bridge match failed: ' . ($res['message'] ?? 'unknown error'));
        }
        return ['id' => isset($res['bestId']) ? (int)$res['bestId'] : null, 'score' => (float)($res['score'] ?? 0)];
    }

    public function status(): array
    {
        try {
            $r = $this->call('GET', '/status');
            return ['ok' => !empty($r['ok']), 'message' => 'Bridge connected: ' . ($r['device'] ?? 'unknown device') . ' (' . ($r['sdk'] ?? 'SDK') . ')'];
        } catch (Throwable $e) {
            return ['ok' => false, 'message' => 'Bridge not reachable at ' . $this->baseUrl . ': ' . $e->getMessage()];
        }
    }

    /** HTTP call using PHP's built-in stream wrapper (no cURL extension required). */
    private function call(string $method, string $path, ?array $body = null): array
    {
        $ctx = stream_context_create(['http' => [
            'method' => $method,
            'header' => "Content-Type: application/json\r\nAccept: application/json\r\n",
            'content' => $body !== null ? json_encode($body) : '',
            'timeout' => 8,
            'ignore_errors' => true,   // read the JSON body even on 4xx/5xx responses
        ]]);
        $raw = @file_get_contents(rtrim($this->baseUrl, '/') . $path, false, $ctx);
        if ($raw === false) {
            $err = error_get_last()['message'] ?? 'connection failed';
            throw new RuntimeException(preg_replace('/^file_get_contents\([^)]*\): /', '', $err));
        }
        $data = json_decode((string)$raw, true);
        if (!is_array($data)) throw new RuntimeException('Invalid response from bridge.');
        return $data;
    }
}
