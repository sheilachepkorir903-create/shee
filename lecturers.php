<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$rules = ['staff_no' => 'required|max:30|regex:/^[A-Za-z0-9\/\-]+$/', 'full_name' => 'required|max:120|regex:/^[\p{L} .\'\-]+$/u',
          'email' => 'required|email|max:120', 'phone' => 'phone', 'department_id' => 'required|int', 'gender' => 'in:Male,Female'];

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $d = [];
        foreach (array_keys($rules) as $k) $d[$k] = input($k);
        $d['staff_no'] = strtoupper($d['staff_no']);
        $errors = validate($d, $rules);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            $pdo = Database::pdo();
            try {
                $pdo->beginTransaction();
                if ($id) {
                    $uid = (int)db_value('SELECT user_id FROM lecturers WHERE id = ?', [$id]);
                    db_query('UPDATE users SET username = ?, email = ?, phone = ?, full_name = ? WHERE id = ?', [$d['staff_no'], $d['email'], $d['phone'] ?: null, $d['full_name'], $uid]);
                    db_query('UPDATE lecturers SET staff_no = ?, department_id = ?, gender = ? WHERE id = ?', [$d['staff_no'], $d['department_id'], $d['gender'] ?: null, $id]);
                    $pdo->commit();
                    audit('lecturer_updated', 'lecturer', $id, $d['staff_no']);
                    flash('success', 'Lecturer updated.');
                } else {
                    $temp = random_password();
                    $uid = db_insert("INSERT INTO users (role, username, email, phone, full_name, password_hash, must_change_password) VALUES ('lecturer', ?, ?, ?, ?, ?, 1)",
                        [$d['staff_no'], $d['email'], $d['phone'] ?: null, $d['full_name'], password_hash($temp, PASSWORD_DEFAULT)]);
                    $lid = db_insert('INSERT INTO lecturers (user_id, staff_no, department_id, gender) VALUES (?, ?, ?, ?)', [$uid, $d['staff_no'], $d['department_id'], $d['gender'] ?: null]);
                    $pdo->commit();
                    audit('lecturer_created', 'lecturer', $lid, $d['staff_no']);
                    flash('success', "Lecturer registered. Login: {$d['staff_no']}  Temporary password: $temp  (must be changed at first login).");
                }
            } catch (PDOException $e) {
                if ($pdo->inTransaction()) $pdo->rollBack();
                if (is_duplicate_error($e)) flash('danger', 'Staff number or email address is already registered.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid department.');
                else throw $e;
            }
        }
    } elseif ($action === 'toggle' && $id) {
        $uid = (int)db_value('SELECT user_id FROM lecturers WHERE id = ?', [$id]);
        db_query('UPDATE users SET is_active = 1 - is_active WHERE id = ?', [$uid]);
        audit('lecturer_status_changed', 'lecturer', $id);
        flash('success', 'Lecturer account status changed.');
    } elseif ($action === 'delete' && $id) {
        if (db_value('SELECT COUNT(*) FROM unit_assignments WHERE lecturer_id = ?', [$id])) {
            flash('danger', 'This lecturer has unit allocations and cannot be deleted. Deactivate the account instead.');
        } else {
            db_query('DELETE FROM users WHERE id = (SELECT user_id FROM lecturers WHERE id = ?)', [$id]);
            audit('lecturer_deleted', 'lecturer', $id);
            flash('success', 'Lecturer deleted.');
        }
    }
    redirect('admin/lecturers.php');
}

$departments = db_all('SELECT id, name FROM departments ORDER BY name');
$rows = db_all('SELECT l.*, u.full_name, u.email, u.phone, u.is_active, u.last_login_at, d.name AS department,
                       (SELECT COUNT(*) FROM unit_assignments a WHERE a.lecturer_id = l.id) AS units
                FROM lecturers l JOIN users u ON u.id = l.user_id JOIN departments d ON d.id = l.department_id ORDER BY u.full_name');
$pageTitle = 'Lecturers';
$active = 'lecturers';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-person-workspace me-1"></i> Lecturers (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-edit='{"id":""}' data-title="Register lecturer" <?= $departments ? '' : 'disabled' ?>><i class="bi bi-person-plus"></i> Register lecturer</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Staff No.</th><th>Name</th><th>Department</th><th>Contact</th><th>Units</th><th>Account</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['staff_no']) ?></td><td><?= e($r['full_name']) ?></td><td><?= e($r['department']) ?></td>
          <td class="small"><?= e($r['email']) ?><br><?= e($r['phone'] ?? '') ?></td><td><?= (int)$r['units'] ?></td>
          <td><?= $r['is_active'] ? '<span class="badge text-bg-success">Active</span>' : '<span class="badge text-bg-secondary">Inactive</span>' ?></td>
          <td class="text-end text-nowrap">
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit lecturer"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'staff_no' => $r['staff_no'], 'full_name' => $r['full_name'], 'email' => $r['email'], 'phone' => $r['phone'], 'department_id' => $r['department_id'], 'gender' => $r['gender']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline"><?= csrf_field() ?><input type="hidden" name="action" value="toggle"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-warning" title="<?= $r['is_active'] ? 'Deactivate' : 'Activate' ?>"><i class="bi bi-<?= $r['is_active'] ? 'pause' : 'play' ?>-circle"></i></button></form>
            <form method="post" class="d-inline" data-confirm="Delete this lecturer?"><?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="7" class="text-center text-muted py-4">No lecturers yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog modal-lg"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Lecturer</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="row g-3">
      <div class="col-md-4"><label class="form-label">Staff number</label><input name="staff_no" class="form-control text-uppercase" required maxlength="30"></div>
      <div class="col-md-8"><label class="form-label">Full name</label><input name="full_name" class="form-control" required maxlength="120"></div>
      <div class="col-md-6"><label class="form-label">Email</label><input type="email" name="email" class="form-control" required maxlength="120"></div>
      <div class="col-md-6"><label class="form-label">Phone</label><input name="phone" class="form-control" maxlength="15"></div>
      <div class="col-md-8"><label class="form-label">Department</label>
        <select name="department_id" class="form-select" required><?php foreach ($departments as $d): ?><option value="<?= (int)$d['id'] ?>"><?= e($d['name']) ?></option><?php endforeach; ?></select></div>
      <div class="col-md-4"><label class="form-label">Gender</label><select name="gender" class="form-select"><option value="">—</option><option>Male</option><option>Female</option></select></div>
    </div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
