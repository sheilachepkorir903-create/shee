<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('student');

$sid = Auth::studentId();
$units = ReportService::studentReport($sid);
$sel = input_int('unit', 'GET');
if ($sel && !in_array($sel, array_map('intval', array_column($units, 'assignment_id')))) $sel = 0;
$history = ReportService::studentHistory($sid, $sel ?: null);
$min = (float)setting('min_attendance_percent', '75');

$pageTitle = 'My Attendance';
$active = 'attendance';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card mb-3">
  <div class="card-header"><i class="bi bi-percent me-1"></i> Attendance percentage per unit</div>
  <div class="table-responsive"><table class="table mb-0">
    <thead><tr><th>Unit</th><th>Lecturer</th><th>Held</th><th>Attended</th><th>Late</th><th>Absent</th><th style="min-width:180px">Attendance</th><th>Status</th></tr></thead>
    <tbody>
    <?php foreach ($units as $u): $p = $u['percent']; ?>
      <tr><td><a href="?unit=<?= (int)$u['assignment_id'] ?>" class="fw-semibold"><?= e($u['code']) ?></a> <?= e($u['name']) ?></td><td><?= e($u['lecturer']) ?></td>
        <td><?= (int)$u['held'] ?></td><td><?= (int)$u['attended'] ?></td><td><?= (int)$u['late'] ?></td><td><?= (int)$u['absent'] ?></td>
        <td><?php if ($p !== null): ?><div class="d-flex align-items-center gap-2"><div class="progress flex-grow-1"><div class="progress-bar bg-<?= $p >= $min ? 'success' : 'danger' ?>" style="width: <?= (float)$p ?>%"></div></div><span class="small fw-semibold"><?= e($p) ?>%</span></div><?php else: ?><span class="text-muted small">No sessions yet</span><?php endif; ?></td>
        <td><?= $p === null ? '' : ($p >= $min ? '<span class="badge text-bg-success">Meets minimum</span>' : '<span class="badge text-bg-danger">Below ' . e($min) . '%</span>') ?></td></tr>
    <?php endforeach; ?>
    <?php if (!$units): ?><tr><td colspan="8" class="text-center text-muted py-4">You are not registered for any units yet.</td></tr><?php endif; ?>
    </tbody></table></div>
</div>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center"><span><i class="bi bi-clock-history me-1"></i> Attendance history <?= $sel ? '(filtered)' : '' ?></span>
    <?php if ($sel): ?><a href="?" class="btn btn-sm btn-light">Show all units</a><?php endif; ?>
    <button class="btn btn-sm btn-outline-secondary ms-auto" onclick="window.print()"><i class="bi bi-printer"></i> Print</button></div>
  <div class="table-responsive"><table class="table table-hover mb-0">
    <thead><tr><th>Date</th><th>Time</th><th>Unit</th><th>Topic</th><th>Status</th><th>Recorded</th><th>Method</th></tr></thead>
    <tbody>
    <?php foreach ($history as $h): ?>
      <tr><td><?= e(fmt_date($h['session_date'])) ?></td><td><?= fmt_time($h['start_time']) ?>–<?= fmt_time($h['end_time']) ?></td><td><?= e($h['code']) ?></td>
        <td class="small"><?= e($h['topic'] ?? '') ?></td><td><?= status_badge($h['status']) ?></td>
        <td><?= $h['status'] !== 'absent' ? fmt_time($h['recorded_at']) : '—' ?></td><td class="small"><?= e($h['method'] === 'auto' ? 'not scanned' : $h['method']) ?></td></tr>
    <?php endforeach; ?>
    <?php if (!$history): ?><tr><td colspan="7" class="text-center text-muted py-4">No attendance records yet.</td></tr><?php endif; ?>
    </tbody></table></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
