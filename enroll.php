<?php
// POST: store an enrolled fingerprint template (admin only).
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');
if (!is_post()) json_response(['ok' => false, 'message' => 'POST required.'], 405);
verify_csrf();

$studentId = input_int('student_id');
if (!db_value('SELECT COUNT(*) FROM students WHERE id = ?', [$studentId])) {
    json_response(['ok' => false, 'message' => 'Student not found.'], 404);
}
$template = (string)($_POST['template'] ?? '');
if ($template === '' || strlen($template) > 65536) json_response(['ok' => false, 'message' => 'No fingerprint data received.'], 422);

$r = AttendanceService::enrol($studentId, input('finger'), $template, input_int('quality'), Auth::id());
json_response($r, $r['ok'] ? 200 : 422);
