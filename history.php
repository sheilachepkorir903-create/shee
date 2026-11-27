<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer');

$lid = Auth::lecturerId();
$sessionId = input_int('session', 'GET');

if (is_post()) {
    verify_csrf();
    $sid = input_int('session_id');
    $s = AttendanceService::session($sid);
    if (!$s || (int)$s['lecturer_id'] !== $lid) {
        flash('danger', 'Session not found.');
    } else {
        $r = AttendanceService::manualMark($sid, input_int('student_id'), input('status'), input('reason'), Auth::id());
        flash($r['ok'] ? 'success' : 'danger', $r['message']);
        if ($r['ok'] && $s['status'] === 'closed') AttendanceService::checkLowAttendance((int)$s['assignment_id']);
    }
    redirect('lecturer/history.php?session=' . $sid);
}

$pageTitle = 'Attendance History';
$active = 'history';

if ($sessionId) {
    $s = AttendanceService::session($sessionId);
    if (!$s || (int)$s['lecturer_id'] !== $lid) redirect('lecturer/history.php');
    $register = ReportService::sessionRegister($sessionId);
    require BSAMS_ROOT . '/app/layout/header.php';
    ?>
    <a href="<?= url('lecturer/history.php') ?>" class="btn btn-sm btn-light mb-3"><i class="bi bi-arrow-left"></i> All sessions</a>
    <div class="card">
      <div class="card-header"><?= e($s['unit_code'] . ' ' . $s['unit_name']) ?> · <?= e($s['class_code']) ?> · <?= e(fmt_date($s['session_date'])) ?> <?= fmt_time($s['start_time']) ?>–<?= fmt_time($s['end_time']) ?> <?= status_badge($s['status']) ?></div>
      <div class="table-responsive"><table class="table table-hover mb-0">
        <thead><tr><th>Admission No.</th><th>Name</th><th>Status</th><th>Method</th><th>Time</th><th>Correct record</th></tr></thead>
        <tbody>
        <?php foreach ($register as $r): ?>
          <tr><td><?= e($r['admission_no']) ?></td><td><?= e($r['full_name']) ?></td>
            <td><?= $r['status'] === 'not recorded' ? '<span class="badge text-bg-light">Not recorded</span>' : status_badge($r['status']) ?></td>
            <td><?= $r['method'] ? status_badge($r['method']) : '' ?><?php if ($r['manual_reason']): ?><div class="small text-muted"><?= e($r['manual_reason']) ?></div><?php endif; ?></td>
            <td><?= $r['status'] !== 'absent' && $r['recorded_at'] ? fmt_time($r['recorded_at']) : '—' ?></td>
            <td>
              <?php if (in_array($s['status'], ['open', 'closed'], true)): ?>
              <form method="post" class="d-flex gap-1"><?= csrf_field() ?><input type="hidden" name="session_id" value="<?= $sessionId ?>"><input type="hidden" name="student_id" value="<?= (int)$r['student_id'] ?>">
                <select name="status" class="form-select form-select-sm" style="width:auto"><option value="present">Present</option><option value="late">Late</option><option value="absent">Absent</option></select>
                <input name="reason" class="form-control form-control-sm" placeholder="Reason (required)" required minlength="5" maxlength="255">
                <button class="btn btn-sm btn-outline-primary">Save</button></form>
              <?php endif; ?>
            </td></tr>
        <?php endforeach; ?>
        </tbody></table></div>
    </div>
    <?php
    require BSAMS_ROOT . '/app/layout/footer.php';
    exit;
}

$rows = db_all("SELECT cs.*, un.code, un.name, k.code AS class_code,
                       SUM(CASE WHEN ar.status IN ('present','late') THEN 1 ELSE 0 END) AS present,
                       SUM(CASE WHEN ar.status = 'absent' THEN 1 ELSE 0 END) AS absent
                FROM class_sessions cs JOIN unit_assignments ua ON ua.id = cs.assignment_id JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id
                LEFT JOIN attendance_records ar ON ar.session_id = cs.id
                WHERE ua.lecturer_id = ? AND cs.status IN ('open','closed')
                GROUP BY cs.id ORDER BY cs.session_date DESC, cs.start_time DESC", [$lid]);
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex align-items-center gap-2"><span><i class="bi bi-clock-history me-1"></i> Sessions held (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl"></div>
  <div class="table-responsive"><table class="table table-hover mb-0" id="tbl">
    <thead><tr><th>Date</th><th>Time</th><th>Unit</th><th>Class</th><th>Topic</th><th>Present</th><th>Absent</th><th>Status</th><th></th></tr></thead>
    <tbody>
    <?php foreach ($rows as $r): ?>
      <tr><td><?= e(fmt_date($r['session_date'])) ?></td><td><?= fmt_time($r['start_time']) ?></td><td><?= e($r['code']) ?></td><td><?= e($r['class_code']) ?></td>
        <td class="small"><?= e($r['topic'] ?? '') ?></td><td><?= (int)$r['present'] ?></td><td><?= (int)$r['absent'] ?></td><td><?= status_badge($r['status']) ?></td>
        <td><a class="btn btn-sm btn-outline-primary" href="?session=<?= (int)$r['id'] ?>">Register</a></td></tr>
    <?php endforeach; ?>
    <?php if (!$rows): ?><tr><td colspan="9" class="text-center text-muted py-4">No sessions held yet.</td></tr><?php endif; ?>
    </tbody></table></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
