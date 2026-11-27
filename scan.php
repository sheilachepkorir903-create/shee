<?php
// POST: identify a scanned fingerprint and record attendance for an open session.
// Only the lecturer who owns the session (or an admin) can submit scans.
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer', 'admin');
if (!is_post()) json_response(['ok' => false, 'message' => 'POST required.'], 405);
verify_csrf();

$sessionId = input_int('session_id');
$s = AttendanceService::session($sessionId);
if (!$s) json_response(['ok' => false, 'result' => 'error', 'message' => 'Session not found.'], 404);
if (Auth::role() === 'lecturer' && (int)$s['lecturer_id'] !== Auth::lecturerId()) {
    audit('access_denied', 'class_session', $sessionId, 'Scan for another lecturer\'s session');
    json_response(['ok' => false, 'result' => 'error', 'message' => 'This is not your session.'], 403);
}
$template = (string)($_POST['template'] ?? '');
if ($template === '' || strlen($template) > 65536) json_response(['ok' => false, 'result' => 'retry', 'message' => 'No fingerprint received.'], 422);

$r = AttendanceService::scan($sessionId, $template, input_int('quality'), Auth::id());
$r['live'] = AttendanceService::live($sessionId);
json_response($r);
