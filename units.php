<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer');

$lid = Auth::lecturerId();
$units = db_all('SELECT ua.*, un.code, un.name, k.code AS class_code, c.name AS course,
                        (SELECT COUNT(*) FROM enrollments e WHERE e.assignment_id = ua.id) AS students,
                        (SELECT COUNT(*) FROM class_sessions cs WHERE cs.assignment_id = ua.id AND cs.status = "closed") AS held
                 FROM unit_assignments ua JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id JOIN courses c ON c.id = k.course_id
                 WHERE ua.lecturer_id = ? ORDER BY ua.academic_year DESC, un.code', [$lid]);
$sel = input_int('unit', 'GET') ?: (int)($units[0]['id'] ?? 0);
if ($sel && !in_array($sel, array_column($units, 'id'))) { http_response_code(403); exit('Access denied.'); }
$students = $sel ? ReportService::unitSummary($sel) : [];
$fingers = $sel ? array_column(db_all('SELECT e.student_id, COUNT(bt.id) n FROM enrollments e LEFT JOIN biometric_templates bt ON bt.student_id = e.student_id WHERE e.assignment_id = ? GROUP BY e.student_id', [$sel]), 'n', 'student_id') : [];

$pageTitle = 'My Units & Students';
$active = 'units';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="row g-3">
  <div class="col-lg-4">
    <div class="list-group">
      <?php foreach ($units as $u): ?>
        <a href="?unit=<?= (int)$u['id'] ?>" class="list-group-item list-group-item-action <?= $sel === (int)$u['id'] ? 'active' : '' ?>">
          <div class="fw-semibold"><?= e($u['code'] . ' ' . $u['name']) ?></div>
          <div class="small <?= $sel === (int)$u['id'] ? '' : 'text-muted' ?>"><?= e($u['class_code']) ?> · <?= e($u['academic_year']) ?> T<?= (int)$u['term'] ?> · <?= (int)$u['students'] ?> students · <?= (int)$u['held'] ?> sessions</div>
        </a>
      <?php endforeach; ?>
      <?php if (!$units): ?><div class="list-group-item text-muted">No units have been allocated to you yet.</div><?php endif; ?>
    </div>
  </div>
  <div class="col-lg-8">
    <div class="card">
      <div class="card-header d-flex align-items-center gap-2"><span><i class="bi bi-people me-1"></i> Registered students (<?= count($students) ?>)</span>
        <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl"></div>
      <div class="table-responsive"><table class="table table-hover mb-0" id="tbl">
        <thead><tr><th>Admission No.</th><th>Name</th><th>Fingerprint</th><th>Attended</th><th>Attendance</th></tr></thead>
        <tbody>
        <?php foreach ($students as $s): ?>
          <tr><td><?= e($s['admission_no']) ?></td><td><?= e($s['full_name']) ?></td>
            <td><?= !empty($fingers[$s['student_id']]) ? '<i class="bi bi-fingerprint text-success" title="Enrolled"></i>' : '<span class="badge text-bg-light text-danger">Not enrolled</span>' ?></td>
            <td><?= (int)$s['attended'] ?>/<?= (int)$s['held'] ?></td><td><?= percent_badge($s['percent']) ?></td></tr>
        <?php endforeach; ?>
        <?php if (!$students): ?><tr><td colspan="5" class="text-center text-muted py-4">No students.</td></tr><?php endif; ?>
        </tbody></table></div>
    </div>
  </div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
