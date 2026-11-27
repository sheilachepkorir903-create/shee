<?php
// POST: the VIRTUAL (simulated) fingerprint scanner. Disabled automatically when a real scanner driver is active.
require __DIR__ . '/../app/bootstrap.php';
require_role('admin', 'lecturer');
if (!is_post()) json_response(['ok' => false, 'message' => 'POST required.'], 405);
verify_csrf();
if (!is_simulation()) {
    json_response(['ok' => false, 'message' => 'The simulated scanner is disabled because the hardware driver is active.'], 403);
}
$identity = input('identity', 'unknown');
if (!preg_match('/^student:\d+:[A-Z_]+$/', $identity)) {
    $identity = 'unknown:' . bin2hex(random_bytes(8)); // an unregistered finger
}
$cap = SimulatedProvider::capture($identity, input('poor') === '1');
json_response(['ok' => true, 'simulated' => true] + $cap);
