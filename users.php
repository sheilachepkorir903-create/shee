<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'create_admin') {
        $d = ['username' => input('username'), 'full_name' => input('full_name'), 'email' => input('email')];
        $errors = validate($d, ['username' => 'required|max:50|regex:/^[A-Za-z0-9._\-]+$/', 'full_name' => 'required|max:120', 'email' => 'required|email|max:120']);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            $temp = random_password();
            try {
                $uid = db_insert("INSERT INTO users (role, username, email, full_name, password_hash, must_change_password) VALUES ('admin', ?, ?, ?, ?, 1)",
                    [$d['username'], $d['email'], $d['full_name'], password_hash($temp, PASSWORD_DEFAULT)]);
                audit('admin_created', 'user', $uid, $d['username']);
                flash('success', "Administrator created. Login: {$d['username']}  Temporary password: $temp");
            } catch (PDOException $e) {
                if (!is_duplicate_error($e)) throw $e;
                flash('danger', 'Username or email already exists.');
            }
        }
    } elseif ($action === 'reset' && $id) {
        $temp = random_password();
        db_query('UPDATE users SET password_hash = ?, must_change_password = 1, failed_attempts = 0, locked_until = NULL WHERE id = ?', [password_hash($temp, PASSWORD_DEFAULT), $id]);
        $u = db_one('SELECT username FROM users WHERE id = ?', [$id]);
        audit('password_reset', 'user', $id);
        flash('success', "Password reset for {$u['username']}. Temporary password: $temp  (the user must change it at next login).");
    } elseif ($action === 'toggle' && $id) {
        if ($id === Auth::id()) {
            flash('danger', 'You cannot deactivate your own account.');
        } else {
            db_query('UPDATE users SET is_active = 1 - is_active WHERE id = ?', [$id]);
            audit('account_status_changed', 'user', $id);
            flash('success', 'Account status changed.');
        }
    } elseif ($action === 'unlock' && $id) {
        db_query('UPDATE users SET failed_attempts = 0, locked_until = NULL WHERE id = ?', [$id]);
        audit('account_unlocked', 'user', $id);
        flash('success', 'Account unlocked.');
    }
    redirect('admin/users.php' . (input('role_filter') ? '?role=' . urlencode(input('role_filter')) : ''));
}

$role = input('role', '', 'GET');
$sql = 'SELECT id, role, username, email, full_name, is_active, must_change_password, locked_until, last_login_at FROM users';
$rows = in_array($role, ['admin', 'lecturer', 'student'], true) ? db_all($sql . ' WHERE role = ? ORDER BY role, username', [$role]) : db_all($sql . ' ORDER BY role, username');
$pageTitle = 'User Accounts';
$active = 'users';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-person-gear me-1"></i> User accounts (<?= count($rows) ?>)</span>
    <form method="get" class="ms-auto"><select name="role" class="form-select form-select-sm" onchange="this.form.submit()"><option value="">All roles</option>
      <?php foreach (['admin', 'lecturer', 'student'] as $r): ?><option value="<?= $r ?>" <?= $role === $r ? 'selected' : '' ?>><?= ucfirst($r) ?></option><?php endforeach; ?></select></form>
    <input class="form-control form-control-sm table-search" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#adminModal"><i class="bi bi-plus-lg"></i> New administrator</button>
  </div>
  <div class="table-responsive"><table class="table table-hover mb-0" id="tbl">
    <thead><tr><th>Username</th><th>Name</th><th>Role</th><th>Email</th><th>Last login</th><th>Status</th><th class="text-end">Actions</th></tr></thead>
    <tbody>
    <?php foreach ($rows as $r): $locked = $r['locked_until'] && strtotime($r['locked_until']) > time(); ?>
      <tr><td class="fw-semibold"><?= e($r['username']) ?></td><td><?= e($r['full_name']) ?></td><td><?= e(ucfirst($r['role'])) ?></td><td class="small"><?= e($r['email'] ?? '') ?></td>
        <td class="small"><?= e(fmt_date($r['last_login_at'], 'd M Y H:i')) ?></td>
        <td><?= $r['is_active'] ? '<span class="badge text-bg-success">Active</span>' : '<span class="badge text-bg-secondary">Inactive</span>' ?>
            <?= $locked ? '<span class="badge text-bg-danger">Locked</span>' : '' ?><?= $r['must_change_password'] ? '<span class="badge text-bg-light text-dark">Temp password</span>' : '' ?></td>
        <td class="text-end text-nowrap">
          <form method="post" class="d-inline" data-confirm="Reset this user's password?"><?= csrf_field() ?><input type="hidden" name="action" value="reset"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>"><input type="hidden" name="role_filter" value="<?= e($role) ?>">
            <button class="btn btn-sm btn-outline-primary" title="Reset password"><i class="bi bi-key"></i></button></form>
          <?php if ($locked): ?><form method="post" class="d-inline"><?= csrf_field() ?><input type="hidden" name="action" value="unlock"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
            <button class="btn btn-sm btn-outline-success" title="Unlock"><i class="bi bi-unlock"></i></button></form><?php endif; ?>
          <?php if ((int)$r['id'] !== Auth::id()): ?><form method="post" class="d-inline"><?= csrf_field() ?><input type="hidden" name="action" value="toggle"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>"><input type="hidden" name="role_filter" value="<?= e($role) ?>">
            <button class="btn btn-sm btn-outline-warning" title="<?= $r['is_active'] ? 'Deactivate' : 'Activate' ?>"><i class="bi bi-<?= $r['is_active'] ? 'pause' : 'play' ?>-circle"></i></button></form><?php endif; ?>
        </td></tr>
    <?php endforeach; ?>
    </tbody></table></div>
</div>
<div class="modal fade" id="adminModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">New administrator</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body"><?= csrf_field() ?><input type="hidden" name="action" value="create_admin">
    <div class="mb-3"><label class="form-label">Username</label><input name="username" class="form-control" required maxlength="50"></div>
    <div class="mb-3"><label class="form-label">Full name</label><input name="full_name" class="form-control" required maxlength="120"></div>
    <div class="mb-3"><label class="form-label">Email</label><input type="email" name="email" class="form-control" required maxlength="120"></div>
    <p class="small text-muted mb-0">A temporary password will be shown after saving. The new administrator must change it at first login.</p></div>
  <div class="modal-footer"><button class="btn btn-primary">Create</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
