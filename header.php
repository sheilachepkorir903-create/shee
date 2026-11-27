<?php
/**
 * Page header + sidebar. Before including, set:
 *   $pageTitle = 'Title';   $active = 'menu-key';
 */
$role = Auth::role();
$menus = [
    'admin' => [
        ['dashboard', 'admin/dashboard.php', 'speedometer2', 'Dashboard'],
        ['__', 'Academic structure'],
        ['departments', 'admin/departments.php', 'building', 'Departments'],
        ['courses', 'admin/courses.php', 'journal-bookmark', 'Courses'],
        ['classes', 'admin/classes.php', 'people', 'Classes'],
        ['units', 'admin/units.php', 'book', 'Units'],
        ['__', 'People'],
        ['students', 'admin/students.php', 'mortarboard', 'Students'],
        ['lecturers', 'admin/lecturers.php', 'person-workspace', 'Lecturers'],
        ['assignments', 'admin/assignments.php', 'diagram-3', 'Unit Allocation & Registration'],
        ['__', 'Biometrics & attendance'],
        ['fingerprints', 'admin/fingerprints.php', 'fingerprint', 'Fingerprint Enrolment'],
        ['attendance', 'admin/attendance.php', 'calendar-check', 'Attendance Records'],
        ['reports', 'admin/reports.php', 'file-earmark-bar-graph', 'Reports'],
        ['__', 'System'],
        ['users', 'admin/users.php', 'person-gear', 'User Accounts'],
        ['announce', 'admin/announce.php', 'megaphone', 'Announcements'],
        ['audit', 'admin/audit_logs.php', 'shield-check', 'Audit Logs'],
        ['settings', 'admin/settings.php', 'gear', 'Settings & Backup'],
    ],
    'lecturer' => [
        ['dashboard', 'lecturer/dashboard.php', 'speedometer2', 'Dashboard'],
        ['units', 'lecturer/units.php', 'book', 'My Units & Students'],
        ['sessions', 'lecturer/sessions.php', 'calendar-plus', 'Attendance Sessions'],
        ['history', 'lecturer/history.php', 'clock-history', 'Attendance History'],
        ['reports', 'lecturer/reports.php', 'file-earmark-bar-graph', 'Reports'],
    ],
    'student' => [
        ['dashboard', 'student/dashboard.php', 'speedometer2', 'Dashboard'],
        ['attendance', 'student/attendance.php', 'calendar-check', 'My Attendance'],
        ['profile', 'student/profile.php', 'person-badge', 'My Profile'],
    ],
];
$unread = (int)db_value('SELECT COUNT(*) FROM notifications WHERE user_id = ? AND is_read = 0', [Auth::id()]);
$institution = setting('institution_name', 'Institution');
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?= e($pageTitle ?? 'BSAMS') ?> · BSAMS</title>
  <link rel="icon" href="<?= url('assets/img/logo.svg') ?>">
  <link rel="stylesheet" href="<?= url('assets/vendor/bootstrap/css/bootstrap.min.css') ?>">
  <link rel="stylesheet" href="<?= url('assets/vendor/bootstrap-icons/bootstrap-icons.min.css') ?>">
  <link rel="stylesheet" href="<?= url('assets/css/app.css') ?>?v=<?= filemtime(BSAMS_ROOT . '/assets/css/app.css') ?>">
  <meta name="csrf-token" content="<?= e(csrf_token()) ?>">
  <meta name="base-url" content="<?= e(config('base_url')) ?>">
</head>
<body>
<div class="app">
  <?php
    $roleLabel = ['admin' => 'Administrator', 'lecturer' => 'Lecturer', 'student' => 'Student'][$role] ?? ucfirst((string)$role);
    $initial = e(mb_strtoupper(mb_substr($_SESSION['name'] ?? '?', 0, 1)));
  ?>
  <aside class="sidebar" id="sidebar">
    <div class="brand">
      <img src="<?= url('assets/img/logo.svg') ?>" alt="" width="40" height="40">
      <div>
        <div class="brand-name">BSAMS</div>
        <div class="brand-sub text-truncate"><?= e($institution) ?></div>
      </div>
    </div>
    <nav class="nav flex-column">
      <?php foreach ($menus[$role] ?? [] as $m): ?>
        <?php if ($m[0] === '__'): ?>
          <div class="nav-section"><?= e($m[1]) ?></div>
        <?php else: ?>
          <a class="nav-link <?= ($active ?? '') === $m[0] ? 'active' : '' ?>" href="<?= url($m[1]) ?>">
            <i class="bi bi-<?= $m[2] ?>"></i><span><?= e($m[3]) ?></span>
          </a>
        <?php endif; ?>
      <?php endforeach; ?>
    </nav>
    <div class="sidebar-user">
      <span class="avatar"><?= $initial ?></span>
      <div class="min-w-0"><div class="name text-truncate"><?= e($_SESSION['name'] ?? '') ?></div><div class="role"><?= e($roleLabel) ?> account</div></div>
    </div>
  </aside>

  <div class="main">
    <header class="topbar">
      <button class="btn btn-link text-dark d-lg-none p-0 me-3" id="sidebarToggle" aria-label="Menu"><i class="bi bi-list fs-3"></i></button>
      <div>
        <h1 class="page-title"><?= e($pageTitle ?? '') ?></h1>
        <div class="page-sub d-none d-sm-block"><?= e($roleLabel) ?><span class="sep">•</span><?= date('l, j F Y') ?></div>
      </div>
      <div class="ms-auto d-flex align-items-center gap-2 gap-md-3">
        <?php if (is_simulation() && $role !== 'student'): ?>
          <span class="sim-chip d-none d-md-inline" title="Fingerprint results are simulated (development mode)"><i class="bi bi-cpu"></i> SIMULATION MODE</span>
        <?php endif; ?>
        <a href="<?= url('notifications.php') ?>" class="icon-btn" title="Notifications">
          <i class="bi bi-bell"></i>
          <?php if ($unread): ?><span class="dot"><?= $unread ?></span><?php endif; ?>
        </a>
        <div class="dropdown">
          <a class="user-chip dropdown-toggle" href="#" data-bs-toggle="dropdown">
            <span class="avatar"><?= $initial ?></span>
            <span class="who d-none d-sm-block"><span class="n d-block"><?= e($_SESSION['name'] ?? '') ?></span><span class="r d-block"><?= e($roleLabel) ?></span></span>
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="<?= url('notifications.php') ?>"><i class="bi bi-bell me-2"></i>Notifications</a></li>
            <li><a class="dropdown-item" href="<?= url('change_password.php') ?>"><i class="bi bi-key me-2"></i>Change password</a></li>
            <li><hr class="dropdown-divider"></li>
            <li>
              <form method="post" action="<?= url('logout.php') ?>"><?= csrf_field() ?>
                <button class="dropdown-item text-danger"><i class="bi bi-box-arrow-right me-2"></i>Log out</button>
              </form>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <main class="content">
      <?php foreach (take_flashes() as $f): ?>
        <div class="alert alert-<?= e($f['type']) ?> alert-dismissible fade show" role="alert">
          <?= e($f['message']) ?><button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      <?php endforeach; ?>
