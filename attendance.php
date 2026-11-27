<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$from = input('from', date('Y-m-d', strtotime('-30 days')), 'GET');
$to = input('to', date('Y-m-d'), 'GET');
$status = input('status', '', 'GET');
$params = [$from, $to];
$sql = "SELECT cs.*, un.code, un.name, k.code AS class_code, lu.full_name AS lecturer, ua.id AS assignment_id,
               (SELECT COUNT(*) FROM enrollments e WHERE e.assignment_id = cs.assignment_id) AS enrolled,
               SUM(CASE WHEN ar.status IN ('present','late') THEN 1 ELSE 0 END) AS present,
               SUM(CASE WHEN ar.status = 'absent' THEN 1 ELSE 0 END) AS absent,
               SUM(CASE WHEN ar.method = 'manual' THEN 1 ELSE 0 END) AS manual,
               SUM(CASE WHEN ar.method = 'simulated' THEN 1 ELSE 0 END) AS simulated
        FROM class_sessions cs JOIN unit_assignments ua ON ua.id = cs.assignment_id JOIN units un ON un.id = ua.unit_id
        JOIN classes k ON k.id = ua.class_id JOIN lecturers l ON l.id = ua.lecturer_id JOIN users lu ON lu.id = l.user_id
        LEFT JOIN attendance_records ar ON ar.session_id = cs.id
        WHERE cs.session_date BETWEEN ? AND ?";
if (in_array($status, ['scheduled', 'open', 'closed', 'cancelled'], true)) { $sql .= ' AND cs.status = ?'; $params[] = $status; }
$rows = db_all($sql . ' GROUP BY cs.id ORDER BY cs.session_date DESC, cs.start_time DESC LIMIT 500', $params);

$pageTitle = 'Attendance Records';
$active = 'attendance';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<form class="card card-body mb-3" method="get">
  <div class="row g-2 align-items-end">
    <div class="col-6 col-md-3"><label class="form-label small">From</label><input type="date" name="from" value="<?= e($from) ?>" class="form-control"></div>
    <div class="col-6 col-md-3"><label class="form-label small">To</label><input type="date" name="to" value="<?= e($to) ?>" class="form-control"></div>
    <div class="col-md-3"><label class="form-label small">Status</label><select name="status" class="form-select"><option value="">All</option>
      <?php foreach (['scheduled', 'open', 'closed', 'cancelled'] as $s): ?><option value="<?= $s ?>" <?= $status === $s ? 'selected' : '' ?>><?= ucfirst($s) ?></option><?php endforeach; ?></select></div>
    <div class="col-md-auto"><button class="btn btn-primary"><i class="bi bi-funnel"></i> Filter</button></div>
  </div>
</form>
<div class="card">
  <div class="card-header d-flex align-items-center gap-2"><span><i class="bi bi-calendar-check me-1"></i> Sessions (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl"></div>
  <div class="table-responsive"><table class="table table-hover mb-0" id="tbl">
    <thead><tr><th>Date</th><th>Time</th><th>Unit</th><th>Class</th><th>Lecturer</th><th>Status</th><th>Present</th><th>Absent</th><th>Method</th><th></th></tr></thead>
    <tbody>
    <?php foreach ($rows as $r): ?>
      <tr><td><?= e(fmt_date($r['session_date'])) ?></td><td><?= fmt_time($r['start_time']) ?>–<?= fmt_time($r['end_time']) ?></td>
        <td><span class="fw-semibold"><?= e($r['code']) ?></span> <span class="small text-muted"><?= e($r['topic'] ?? '') ?></span></td>
        <td><?= e($r['class_code']) ?></td><td><?= e($r['lecturer']) ?></td><td><?= status_badge($r['status']) ?></td>
        <td><?= (int)$r['present'] ?>/<?= (int)$r['enrolled'] ?></td><td><?= (int)$r['absent'] ?></td>
        <td class="small"><?= $r['simulated'] ? '<span class="badge text-bg-warning">' . (int)$r['simulated'] . ' simulated</span> ' : '' ?><?= $r['manual'] ? '<span class="badge text-bg-info">' . (int)$r['manual'] . ' manual</span>' : '' ?></td>
        <td><?php if (in_array($r['status'], ['open', 'closed'], true)): ?><a class="btn btn-sm btn-outline-primary" href="<?= url('admin/reports.php?type=session&assignment_id=' . (int)$r['assignment_id'] . '&session_id=' . (int)$r['id']) ?>">Register</a><?php endif; ?></td></tr>
    <?php endforeach; ?>
    <?php if (!$rows): ?><tr><td colspan="10" class="text-center text-muted py-4">No sessions in this period.</td></tr><?php endif; ?>
    </tbody></table></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
