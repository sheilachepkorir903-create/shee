<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$viewId = input_int('id', 'GET');
if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $d = ['unit_id' => input('unit_id'), 'class_id' => input('class_id'), 'lecturer_id' => input('lecturer_id'),
              'academic_year' => input('academic_year'), 'term' => input('term')];
        $errors = validate($d, ['unit_id' => 'required|int', 'class_id' => 'required|int', 'lecturer_id' => 'required|int',
                                'academic_year' => 'required|regex:/^\d{4}\/\d{4}$/', 'term' => 'required|in:1,2,3']);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    db_query('UPDATE unit_assignments SET unit_id = ?, class_id = ?, lecturer_id = ?, academic_year = ?, term = ? WHERE id = ?',
                        [$d['unit_id'], $d['class_id'], $d['lecturer_id'], $d['academic_year'], $d['term'], $id]);
                    audit('allocation_updated', 'unit_assignment', $id);
                    flash('success', 'Allocation updated.');
                } else {
                    $id = db_insert('INSERT INTO unit_assignments (unit_id, class_id, lecturer_id, academic_year, term) VALUES (?, ?, ?, ?, ?)',
                        [$d['unit_id'], $d['class_id'], $d['lecturer_id'], $d['academic_year'], $d['term']]);
                    $n = 0;
                    if (input('register_class') === '1') {
                        $n = db_query("INSERT IGNORE INTO enrollments (student_id, assignment_id) SELECT id, ? FROM students WHERE class_id = ? AND status = 'active'", [$id, $d['class_id']])->rowCount();
                    }
                    audit('allocation_created', 'unit_assignment', $id, "$n students registered");
                    flash('success', "Unit allocated to lecturer. $n student(s) registered for the unit.");
                }
            } catch (PDOException $e) {
                if (is_duplicate_error($e)) flash('danger', 'This unit is already allocated to that class for the selected year and term.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid unit, class and lecturer.');
                else throw $e;
            }
        }
        redirect('admin/assignments.php');
    } elseif ($action === 'delete' && $id) {
        if (db_value('SELECT COUNT(*) FROM class_sessions WHERE assignment_id = ?', [$id])) {
            flash('danger', 'This allocation already has attendance sessions and cannot be deleted.');
        } else {
            db_query('DELETE FROM unit_assignments WHERE id = ?', [$id]);
            audit('allocation_deleted', 'unit_assignment', $id);
            flash('success', 'Allocation deleted.');
        }
        redirect('admin/assignments.php');
    } elseif ($action === 'enrol_class' && $id) {
        $classId = (int)db_value('SELECT class_id FROM unit_assignments WHERE id = ?', [$id]);
        $n = db_query("INSERT IGNORE INTO enrollments (student_id, assignment_id) SELECT id, ? FROM students WHERE class_id = ? AND status = 'active'", [$id, $classId])->rowCount();
        audit('enrolled_class', 'unit_assignment', $id, "$n added");
        flash('success', "$n student(s) registered.");
        redirect('admin/assignments.php?id=' . $id);
    } elseif ($action === 'enrol_student' && $id) {
        try {
            db_query('INSERT INTO enrollments (student_id, assignment_id) VALUES (?, ?)', [input_int('student_id'), $id]);
            audit('enrolled_student', 'unit_assignment', $id, 'Student #' . input_int('student_id'));
            flash('success', 'Student registered for the unit.');
        } catch (PDOException $e) {
            if (!is_duplicate_error($e) && !is_fk_error($e)) throw $e;
            flash('warning', 'Student is already registered or does not exist.');
        }
        redirect('admin/assignments.php?id=' . $id);
    } elseif ($action === 'unenrol' && $id) {
        $sid = input_int('student_id');
        if (db_value('SELECT COUNT(*) FROM attendance_records ar JOIN class_sessions cs ON cs.id = ar.session_id WHERE cs.assignment_id = ? AND ar.student_id = ?', [$id, $sid])) {
            flash('danger', 'The student already has attendance in this unit and cannot be removed.');
        } else {
            db_query('DELETE FROM enrollments WHERE assignment_id = ? AND student_id = ?', [$id, $sid]);
            audit('unenrolled_student', 'unit_assignment', $id, "Student #$sid");
            flash('success', 'Student removed from the unit.');
        }
        redirect('admin/assignments.php?id=' . $id);
    }
}

$pageTitle = 'Unit Allocation & Registration';
$active = 'assignments';

if ($viewId) {
    $a = db_one('SELECT ua.*, un.code, un.name, k.code AS class_code, lu.full_name AS lecturer FROM unit_assignments ua
                 JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id
                 JOIN lecturers l ON l.id = ua.lecturer_id JOIN users lu ON lu.id = l.user_id WHERE ua.id = ?', [$viewId]);
    if (!$a) redirect('admin/assignments.php');
    $enrolled = db_all('SELECT s.id, s.admission_no, u.full_name, k.code AS class_code, (SELECT COUNT(*) FROM biometric_templates bt WHERE bt.student_id = s.id) AS fingers
                        FROM enrollments e JOIN students s ON s.id = e.student_id JOIN users u ON u.id = s.user_id JOIN classes k ON k.id = s.class_id
                        WHERE e.assignment_id = ? ORDER BY s.admission_no', [$viewId]);
    $others = db_all("SELECT s.id, s.admission_no, u.full_name FROM students s JOIN users u ON u.id = s.user_id
                      WHERE s.status = 'active' AND s.id NOT IN (SELECT student_id FROM enrollments WHERE assignment_id = ?) ORDER BY s.admission_no", [$viewId]);
    require BSAMS_ROOT . '/app/layout/header.php';
    ?>
    <a href="<?= url('admin/assignments.php') ?>" class="btn btn-sm btn-light mb-3"><i class="bi bi-arrow-left"></i> Back to allocations</a>
    <div class="card">
      <div class="card-header d-flex flex-wrap gap-2 align-items-center">
        <span><?= e($a['code'] . ' ' . $a['name']) ?> · <?= e($a['class_code']) ?> · <?= e($a['lecturer']) ?> · <?= e($a['academic_year']) ?> T<?= (int)$a['term'] ?></span>
        <form method="post" class="ms-auto"><?= csrf_field() ?><input type="hidden" name="action" value="enrol_class"><input type="hidden" name="id" value="<?= $viewId ?>">
          <button class="btn btn-sm btn-outline-primary"><i class="bi bi-people"></i> Register whole class</button></form>
        <form method="post" class="d-flex gap-2"><?= csrf_field() ?><input type="hidden" name="action" value="enrol_student"><input type="hidden" name="id" value="<?= $viewId ?>">
          <select name="student_id" class="form-select form-select-sm" required><option value="">Add a student…</option>
            <?php foreach ($others as $o): ?><option value="<?= (int)$o['id'] ?>"><?= e($o['admission_no'] . ' – ' . $o['full_name']) ?></option><?php endforeach; ?></select>
          <button class="btn btn-sm btn-primary">Add</button></form>
      </div>
      <div class="table-responsive"><table class="table table-hover mb-0">
        <thead><tr><th>Admission No.</th><th>Name</th><th>Class</th><th>Fingerprints</th><th class="text-end">Remove</th></tr></thead>
        <tbody>
        <?php foreach ($enrolled as $s): ?>
          <tr><td><?= e($s['admission_no']) ?></td><td><?= e($s['full_name']) ?></td><td><?= e($s['class_code']) ?></td>
            <td><?= $s['fingers'] ? '<span class="badge text-bg-success">Enrolled</span>' : '<span class="badge text-bg-light text-danger">Not enrolled</span>' ?></td>
            <td class="text-end"><form method="post" data-confirm="Remove this student from the unit?"><?= csrf_field() ?><input type="hidden" name="action" value="unenrol">
              <input type="hidden" name="id" value="<?= $viewId ?>"><input type="hidden" name="student_id" value="<?= (int)$s['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-lg"></i></button></form></td></tr>
        <?php endforeach; ?>
        <?php if (!$enrolled): ?><tr><td colspan="5" class="text-center text-muted py-4">No students registered yet.</td></tr><?php endif; ?>
        </tbody></table></div>
    </div>
    <?php
    require BSAMS_ROOT . '/app/layout/footer.php';
    exit;
}

$units = db_all('SELECT id, code, name FROM units ORDER BY code');
$classes = db_all('SELECT id, code FROM classes ORDER BY code');
$lecturers = db_all('SELECT l.id, u.full_name, l.staff_no FROM lecturers l JOIN users u ON u.id = l.user_id WHERE u.is_active = 1 ORDER BY u.full_name');
$rows = db_all('SELECT ua.*, un.code, un.name, k.code AS class_code, lu.full_name AS lecturer,
                       (SELECT COUNT(*) FROM enrollments e WHERE e.assignment_id = ua.id) AS students,
                       (SELECT COUNT(*) FROM class_sessions cs WHERE cs.assignment_id = ua.id) AS sessions
                FROM unit_assignments ua JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id
                JOIN lecturers l ON l.id = ua.lecturer_id JOIN users lu ON lu.id = l.user_id
                ORDER BY ua.academic_year DESC, ua.term DESC, un.code');
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-diagram-3 me-1"></i> Unit allocations (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Allocate unit"
            data-edit='<?= e(json_encode(['id' => '', 'academic_year' => current_academic_year(), 'term' => 1])) ?>'><i class="bi bi-plus-lg"></i> Allocate unit</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Unit</th><th>Class</th><th>Lecturer</th><th>Year / Term</th><th>Students</th><th>Sessions</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td><span class="fw-semibold"><?= e($r['code']) ?></span> <?= e($r['name']) ?></td><td><?= e($r['class_code']) ?></td><td><?= e($r['lecturer']) ?></td>
          <td><?= e($r['academic_year']) ?> · T<?= (int)$r['term'] ?></td><td><?= (int)$r['students'] ?></td><td><?= (int)$r['sessions'] ?></td>
          <td class="text-end text-nowrap">
            <a href="<?= url('admin/assignments.php?id=' . (int)$r['id']) ?>" class="btn btn-sm btn-outline-success" title="Registered students"><i class="bi bi-people"></i></a>
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit allocation"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'unit_id' => $r['unit_id'], 'class_id' => $r['class_id'], 'lecturer_id' => $r['lecturer_id'], 'academic_year' => $r['academic_year'], 'term' => $r['term']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this allocation?"><?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="7" class="text-center text-muted py-4">No allocations yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog modal-lg"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Allocation</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="row g-3">
      <div class="col-md-6"><label class="form-label">Unit</label><select name="unit_id" class="form-select" required><?php foreach ($units as $u): ?><option value="<?= (int)$u['id'] ?>"><?= e($u['code'] . ' – ' . $u['name']) ?></option><?php endforeach; ?></select></div>
      <div class="col-md-6"><label class="form-label">Class</label><select name="class_id" class="form-select" required><?php foreach ($classes as $c): ?><option value="<?= (int)$c['id'] ?>"><?= e($c['code']) ?></option><?php endforeach; ?></select></div>
      <div class="col-md-6"><label class="form-label">Lecturer</label><select name="lecturer_id" class="form-select" required><?php foreach ($lecturers as $l): ?><option value="<?= (int)$l['id'] ?>"><?= e($l['full_name'] . ' (' . $l['staff_no'] . ')') ?></option><?php endforeach; ?></select></div>
      <div class="col-md-3"><label class="form-label">Academic year</label><input name="academic_year" class="form-control" required pattern="\d{4}/\d{4}" placeholder="2026/2027"></div>
      <div class="col-md-3"><label class="form-label">Term</label><select name="term" class="form-select"><option>1</option><option>2</option><option>3</option></select></div>
      <div class="col-12 form-check ms-2"><input class="form-check-input" type="checkbox" name="register_class" value="1" id="rc" checked><label class="form-check-label" for="rc">Register all active students of the class for this unit (new allocations only)</label></div>
    </div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
