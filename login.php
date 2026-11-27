<?php
require __DIR__ . '/app/bootstrap.php';

if (Auth::check()) redirect(Auth::homeFor(Auth::role()));

$error = null;
$login = '';
if (is_post()) {
    verify_csrf();
    $login = input('username');
    $password = (string)($_POST['password'] ?? '');
    if ($login === '' || $password === '') {
        $error = 'Enter your username and password.';
    } else {
        $error = Auth::attempt($login, $password);
        if ($error === null) {
            redirect(!empty($_SESSION['must_change_password']) ? 'change_password.php' : Auth::homeFor(Auth::role()));
        }
    }
}
$institution = setting('institution_name', 'Institution');
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sign in · BSAMS</title>
  <link rel="icon" href="<?= url('assets/img/logo.svg') ?>">
  <link rel="stylesheet" href="<?= url('assets/vendor/bootstrap/css/bootstrap.min.css') ?>">
  <link rel="stylesheet" href="<?= url('assets/css/app.css') ?>?v=<?= filemtime(BSAMS_ROOT . '/assets/css/app.css') ?>">
</head>
<body class="login-body d-flex align-items-center justify-content-center p-3" style="min-height:100vh">
  <div class="card shadow-sm p-4" style="width:100%;max-width:380px">
    <div class="text-center mb-4">
      <img src="<?= url('assets/img/logo.svg') ?>" width="52" height="52" alt="">
      <h1 class="h5 fw-bold text-navy mt-2 mb-0">Student Attendance System</h1>
      <div class="small text-muted"><?= e($institution) ?></div>
    </div>
    <?php foreach (take_flashes() as $f): ?>
      <div class="alert alert-<?= e($f['type']) ?> py-2"><?= e($f['message']) ?></div>
    <?php endforeach; ?>
    <?php if ($error): ?><div class="alert alert-danger py-2" role="alert"><?= e($error) ?></div><?php endif; ?>
    <form method="post" autocomplete="off" novalidate>
      <?= csrf_field() ?>
      <div class="mb-3">
        <label class="form-label" for="username">Username</label>
        <input class="form-control" id="username" name="username" value="<?= e($login) ?>" required autofocus maxlength="120" placeholder="Admission no., staff no. or email">
      </div>
      <div class="mb-3">
        <label class="form-label" for="password">Password</label>
        <input class="form-control" type="password" id="password" name="password" required maxlength="255">
      </div>
      <button class="btn btn-primary w-100" type="submit">Sign in</button>
    </form>
    <p class="small text-muted text-center mt-3 mb-0">Forgot your password? Contact the administrator.</p>
  </div>
</body>
</html>
