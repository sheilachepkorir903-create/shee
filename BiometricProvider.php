<?php
/**
 * BiometricProvider - the ONLY interface the rest of BSAMS uses for fingerprints.
 *
 * To support a new scanner, write a new class that implements this interface
 * and register it in ProviderFactory. No other module needs to change.
 */
declare(strict_types=1);

interface BiometricProvider
{
    /** Driver name stored with templates and attendance records: 'simulated' or 'hardware'. */
    public function name(): string;

    /** True when results are NOT real biometric recognition. */
    public function isSimulated(): bool;

    /**
     * Check and normalise a template received from the scanner adapter before it is encrypted and stored.
     * Throws InvalidArgumentException if the template is malformed.
     */
    public function prepareTemplate(string $captured): string;

    /**
     * Compare a probe template against candidate templates (1:N identification).
     * @param array<int, array{id:int, template:string}> $candidates
     * @return array{id: ?int, score: float}  best candidate id and similarity score on a 0-100 scale
     */
    public function identify(string $probe, array $candidates): array;

    /** Device/driver status for the settings page: ['ok'=>bool, 'message'=>string]. */
    public function status(): array;
}
