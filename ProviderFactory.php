<?php
/**
 * ProviderFactory - returns the biometric driver selected in System Settings.
 * Add new drivers here (e.g. a different vendor) without changing any other file.
 */
declare(strict_types=1);

final class ProviderFactory
{
    public static function make(): BiometricProvider
    {
        return match (setting('biometric_driver', 'simulated')) {
            'bridge'    => new BridgeProvider(setting('bridge_url', 'http://127.0.0.1:8765')),
            default     => new SimulatedProvider(),
        };
    }
}
