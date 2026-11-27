<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

/** Create a student and its login account. Returns [studentId, tempPassword] or throws. */
function create_student(array $d): array
{
    $pdo = Database::pdo();
    $temp = random_password();
    $pdo->beginTransaction();
    try {
        $uid = db_insert("INSERT INTO users (role, username, email, phone, full_name, password_hash, must_change_password) VALUES ('student', ?, ?, ?, ?, ?, 1)",
            [$d['admission_no'], $d['email'] ?: null, $d['phone'] ?: null, $d['full_name'], password_hash($temp, PASSWORD_DEFAULT)]);
        $sid = db_insert('INSERT INTO students (user_id, admission_no, class_id, gender, date_of_birth, status) VALUES (?, ?, ?, ?, ?, ?)',
            [$uid, $d['admission_no'], $d['class_id'], $d['gender'] ?: null, $d['date_of_birth'] ?: null, $d['status'] ?: 'active']);
        // Automatically register the student for all units currently allocated to the class
        db_query('INSERT IGNORE INTO enrollments (student_id, assignment_id) SELECT ?, id FROM unit_assignments WHERE class_id = ? AND academic_year = ?',
            [$sid, $d['class_id'], current_academic_year()]);
        $pdo->commit();
    } catch (Throwable $e) {
        $pdo->rollBack();
        throw $e;
    }
    audit('student_created', 'student', $sid, $d['admission_no']);
    return [$sid, $temp];
}

$rules = ['admission_no' => 'required|max:30|regex:/^[A-Za-z0-9\/\-]+$/', 'full_name' => 'required|max:120|regex:/^[\p{L} .\'\-]+$/u',
          'email' => 'email|max:120', 'phone' => 'phone', 'class_id' => 'required|int', 'gender' => 'in:Male,Female',
          'date_of_birth' => 'date', 'status' => 'required|in:active,suspended,completed,withdrawn'];

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $d = [];
        foreach (array_keys($rules) as $k) $d[$k] = input($k);
        $d['admission_no'] = strtoupper($d['admission_no']);
        $d['status'] = $d['status'] ?: 'active';
        $errors = validate($d, $rules);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    $uid = (int)db_value('SELECT user_id FROM students WHERE id = ?', [$id]);
                    $pdo = Database::pdo();
                    $pdo->beginTransaction();
                    db_query('UPDATE users SET username = ?, email = ?, phone = ?, full_name = ?, is_active = ? WHERE id = ?',
                        [$d['admission_no'], $d['email'] ?: null, $d['phone'] ?: null, $d['full_name'], $d['status'] === 'active' ? 1 : 0, $uid]);
                    db_query('UPDATE students SET admission_no = ?, class_id = ?, gender = ?, date_of_birth = ?, status = ? WHERE id = ?',
                        [$d['admission_no'], $d['class_id'], $d['gender'] ?: null, $d['date_of_birth'] ?: null, $d['status'], $id]);
                    $pdo->commit();
                    audit('student_updated', 'student', $id, $d['admission_no']);
                    flash('success', 'Student updated.');
                } else {
                    [$sid, $temp] = create_student($d);
                    flash('success', "Student registered. Login: {$d['admission_no']}  Temporary password: $temp  (give this to the student; they must change it at first login).");
                }
            } catch (PDOException $e) {
                if (Database::pdo()->inTransaction()) Database::pdo()->rollBack();
                if (is_duplicate_error($e)) flash('danger', 'Admission number or email address is already registered.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid class.');
                else throw $e;
            }
        }
    } elseif ($action === 'delete' && $id) {
        $uid = (int)db_value('SELECT user_id FROM students WHERE id = ?', [$id]);
        $hasAttendance = db_value('SELECT COUNT(*) FROM attendance_records WHERE student_id = ?', [$id]);
        if ($hasAttendance) {
            flash('danger', 'This student has attendance records and cannot be deleted. Change the status to Withdrawn or Completed instead.');
        } else {
            db_query('DELETE FROM users WHERE id = ?', [$uid]); // cascades to student, templates, consents
            audit('student_deleted', 'student', $id);
            flash('success', 'Student deleted together with any fingerprint templates.');
        }
    } elseif ($action === 'import' && !empty($_FILES['csv']['tmp_name'])) {
        // CSV columns: admission_no, full_name, gender, email, phone, class_code
        $fh = fopen($_FILES['csv']['tmp_name'], 'r');
        $classes = array_column(db_all('SELECT id, code FROM classes'), 'id', 'code');
        $ok = 0; $fail = [];
        $line = 0;
        while (($row = fgetcsv($fh)) !== false) {
            $line++;
            if ($line === 1 && stripos($row[0] ?? '', 'admission') !== false) continue;
            $row = array_map('trim', array_pad($row, 6, ''));
            $d = ['admission_no' => strtoupper(ltrim($row[0], "\xEF\xBB\xBF")), 'full_name' => $row[1], 'gender' => $row[2], 'email' => $row[3], 'phone' => $row[4],
                  'class_id' => (string)($classes[strtoupper($row[5])] ?? ''), 'date_of_birth' => '', 'status' => 'active'];
            $err = validate($d, $rules);
            if ($err) { $fail[] = "line $line: " . reset($err); continue; }
            try { create_student($d); $ok++; }
            catch (PDOException $e) { $fail[] = "line $line: " . (is_duplicate_error($e) ? 'duplicate admission no./email' : 'database error'); }
        }
        fclose($fh);
        audit('students_imported', 'student', null, "$ok imported, " . count($fail) . ' failed');
        flash($fail ? 'warning' : 'success', "$ok student(s) imported." . ($fail ? ' Problems: ' . implode('; ', array_slice($fail, 0, 8)) : '') . ' Use User Accounts to reset passwords for imported students.');
    }
    redirect('admin/students.php' . (input('class_filter') ? '?class=' . input_int('class_filter') : ''));
}

$classFilter = input_int('class', 'GET');
$classes = db_all('SELECT id, code, name FROM classes ORDER BY code');
$sql = "SELECT s.*, u.full_name, u.email, u.phone, k.code AS class_code,
               (SELECT COUNT(*) FROM biometric_templates bt WHERE bt.student_id = s.id) AS fingers
        FROM students s JOIN users u ON u.id = s.user_id JOIN classes k ON k.id = s.class_id";
$rows = $classFilter ? db_all($sql . ' WHERE s.class_id = ? ORDER BY s.admission_no', [$classFilter]) : db_all($sql . ' ORDER BY s.admission_no');
$pageTitle = 'Students';
$active = 'students';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-mortarboard me-1"></i> Students (<?= count($rows) ?>)</span>
    <form class="ms-auto d-flex gap-2" method="get">
      <select name="class" class="form-select form-select-sm" onchange="this.form.submit()">
        <option value="0">All classes</option>
        <?php foreach ($classes as $c): ?><option value="<?= (int)$c['id'] ?>" <?= $classFilter === (int)$c['id'] ? 'selected' : '' ?>><?= e($c['code']) ?></option><?php endforeach; ?>
      </select>
    </form>
    <input class="form-control form-control-sm table-search" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#importModal"><i class="bi bi-upload"></i> Import CSV</button>
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Register student"
            data-edit='<?= e(json_encode(['id' => '', 'status' => 'active', 'class_id' => $classFilter ?: ($classes[0]['id'] ?? '')])) ?>' <?= $classes ? '' : 'disabled' ?>><i class="bi bi-person-plus"></i> Register student</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Admission No.</th><th>Name</th><th>Class</th><th>Contact</th><th>Fingerprints</th><th>Status</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['admission_no']) ?></td>
          <td><?= e($r['full_name']) ?><div class="small text-muted"><?= e($r['gender'] ?? '') ?></div></td>
          <td><?= e($r['class_code']) ?></td>
          <td class="small"><?= e($r['email'] ?? '') ?><br><?= e($r['phone'] ?? '') ?></td>
          <td><?= $r['fingers'] ? '<span class="badge text-bg-success"><i class="bi bi-fingerprint"></i> ' . (int)$r['fingers'] . ' enrolled</span>' : '<span class="badge text-bg-light text-danger">Not enrolled</span>' ?></td>
          <td><?= status_badge($r['status']) ?></td>
          <td class="text-end text-nowrap">
            <a class="btn btn-sm btn-outline-success" href="<?= url('admin/fingerprints.php?student=' . (int)$r['id']) ?>" title="Fingerprints"><i class="bi bi-fingerprint"></i></a>
            <a class="btn btn-sm btn-outline-secondary" href="<?= url('admin/reports.php?type=student&student_id=' . (int)$r['id']) ?>" title="Attendance report"><i class="bi bi-bar-chart"></i></a>
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit student"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'admission_no' => $r['admission_no'], 'full_name' => $r['full_name'], 'email' => $r['email'], 'phone' => $r['phone'],
                        'class_id' => $r['class_id'], 'gender' => $r['gender'], 'date_of_birth' => $r['date_of_birth'], 'status' => $r['status']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this student permanently?">
              <?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="7" class="text-center text-muted py-4">No students found.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog modal-lg"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Student</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id"><input type="hidden" name="class_filter" value="<?= $classFilter ?>">
    <div class="row g-3">
      <div class="col-md-5"><label class="form-label">Admission number</label><input name="admission_no" class="form-control text-uppercase" required maxlength="30" placeholder="e.g. DIT/001/2026"></div>
      <div class="col-md-7"><label class="form-label">Full name</label><input name="full_name" class="form-control" required maxlength="120"></div>
      <div class="col-md-4"><label class="form-label">Gender</label><select name="gender" class="form-select"><option value="">—</option><option>Male</option><option>Female</option></select></div>
      <div class="col-md-4"><label class="form-label">Date of birth</label><input type="date" name="date_of_birth" class="form-control"></div>
      <div class="col-md-4"><label class="form-label">Status</label><select name="status" class="form-select"><option value="active">Active</option><option value="suspended">Suspended</option><option value="completed">Completed</option><option value="withdrawn">Withdrawn</option></select></div>
      <div class="col-md-6"><label class="form-label">Email</label><input type="email" name="email" class="form-control" maxlength="120"></div>
      <div class="col-md-6"><label class="form-label">Phone</label><input name="phone" class="form-control" maxlength="15" placeholder="07XXXXXXXX"></div>
      <div class="col-12"><label class="form-label">Class</label>
        <select name="class_id" class="form-select" required><?php foreach ($classes as $c): ?><option value="<?= (int)$c['id'] ?>"><?= e($c['code'] . ' – ' . $c['name']) ?></option><?php endforeach; ?></select>
        <div class="form-text">New students are automatically registered for the units allocated to their class this academic year.</div></div>
    </div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>

<div class="modal fade" id="importModal" tabindex="-1"><div class="modal-dialog"><form method="post" enctype="multipart/form-data" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Import students from CSV</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="import">
    <p class="small">Columns (first row may be a header): <code>admission_no, full_name, gender, email, phone, class_code</code></p>
    <input type="file" name="csv" accept=".csv,text/csv" class="form-control" required>
  </div>
  <div class="modal-footer"><button class="btn btn-primary">Import</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
