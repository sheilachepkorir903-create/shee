<?php
require __DIR__ . '/app/bootstrap.php';
require_role('admin', 'lecturer', 'student');

$errors = [];
if (is_post()) {
    verify_csrf();
    $current = (string)($_POST['current_password'] ?? '');
    $new = (string)($_POST['new_password'] ?? '');
    $confirm = (string)($_POST['confirm_password'] ?? '');
    $hash = db_value('SELECT password_hash FROM users WHERE id = ?', [Auth::id()]);
    if (!password_verify($current, (string)$hash)) $errors[] = 'Current password is incorrect.';
    if ($e = password_errors($new)) $errors[] = $e;
    if ($new !== $confirm) $errors[] = 'New password and confirmation do not match.';
    if ($new === $current) $errors[] = 'New password must be different from the current password.';
    if (!$errors) {
        db_query('UPDATE users SET password_hash = ?, must_change_password = 0 WHERE id = ?', [password_hash($new, PASSWORD_DEFAULT), Auth::id()]);
        $_SESSION['must_change_password'] = 0;
        session_regenerate_id(true);
        audit('password_changed', 'user', Auth::id());
        flash('success', 'Your password has been changed.');
        redirect(Auth::homeFor(Auth::role()));
    }
}
$pageTitle = 'Change Password';
$active = '';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="row justify-content-center">
  <div class="col-md-7 col-lg-5">
    <div class="card">
      <div class="card-header"><i class="bi bi-key me-1"></i> Change your password</div>
      <div class="card-body">
        <?php if (!empty($_SESSION['must_change_password'])): ?>
          <div class="alert alert-info py-2">For security, you must set your own password before using the system.</div>
        <?php endif; ?>
        <?php foreach ($errors as $er): ?><div class="alert alert-danger py-2"><?= e($er) ?></div><?php endforeach; ?>
        <form method="post">
          <?= csrf_field() ?>
          <div class="mb-3"><label class="form-label">Current password</label><input type="password" name="current_password" class="form-control" required></div>
          <div class="mb-3"><label class="form-label">New password</label><input type="password" name="new_password" class="form-control" required minlength="8">
            <div class="form-text">At least 8 characters with upper-case, lower-case letters and a number.</div></div>
          <div class="mb-3"><label class="form-label">Confirm new password</label><input type="password" name="confirm_password" class="form-control" required></div>
          <button class="btn btn-primary w-100">Save new password</button>
        </form>
      </div>
    </div>
  </div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
