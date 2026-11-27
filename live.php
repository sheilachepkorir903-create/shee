<?php
// GET: live attendance for a session (polled by the attendance station / monitor).
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer', 'admin');

$sessionId = input_int('session_id', 'GET');
$s = AttendanceService::session($sessionId);
if (!$s) json_response(['ok' => false, 'message' => 'Session not found.'], 404);
if (Auth::role() === 'lecturer' && (int)$s['lecturer_id'] !== Auth::lecturerId()) {
    json_response(['ok' => false, 'message' => 'This is not your session.'], 403);
}
json_response(['ok' => true] + AttendanceService::live($sessionId));
