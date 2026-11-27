<?php
/**
 * BSAMS configuration.
 * Edit these values to match your computer. This folder is blocked from the web by .htaccess.
 */
return [
    // ---- Database (XAMPP MariaDB/MySQL) ----
    // XAMPP's default port is 3306. On this computer 3306 is used by the separate "MySQL80"
    // Windows service, so XAMPP MariaDB is started on 3307. Change to 3306 if yours is free.
    'db_host' => '127.0.0.1',
    'db_port' => 3306,
    'db_name' => 'bsams',
    'db_user' => 'root',
    'db_pass' => '',

    // ---- Application ----
    'base_url'        => '/bsams',          // URL path where the app is served (http://localhost/bsams)
    'app_name'        => 'BSAMS',
    'debug'           => true,              // set to false in production (hides error details)
    'timezone'        => 'Africa/Nairobi',
    'session_timeout' => 1800,              // seconds of inactivity before automatic logout (30 min)
    'max_login_attempts' => 5,
    'lockout_minutes'    => 15,

    // ---- Biometric template encryption key (AES-256-GCM) ----
    // Created automatically by database/setup.php. Keep it secret and back it up separately:
    // without it, stored templates cannot be decrypted.
    'template_key_file' => __DIR__ . '/../storage/keys/biometric.key',

    // ---- Simulated scanner secret (development only) ----
    'sim_secret' => 'change-this-simulation-secret',
];
