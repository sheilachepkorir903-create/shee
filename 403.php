<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Access denied · BSAMS</title>
<link rel="stylesheet" href="<?= url('assets/vendor/bootstrap/css/bootstrap.min.css') ?>">
<link rel="stylesheet" href="<?= url('assets/css/app.css') ?>?v=<?= filemtime(BSAMS_ROOT . '/assets/css/app.css') ?>"></head>
<body class="d-flex align-items-center justify-content-center" style="min-height:100vh">
<div class="text-center p-4">
  <div class="display-1 fw-bold text-navy">403</div>
  <h2 class="h4">Access denied</h2>
  <p class="text-muted">You do not have permission to open this page. This attempt has been recorded.</p>
  <a class="btn btn-primary" href="<?= url(Auth::homeFor(Auth::role())) ?>">Go to my dashboard</a>
</div>
</body></html>
