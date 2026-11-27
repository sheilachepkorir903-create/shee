<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('student');

$sid = Auth::studentId();
$me = db_one('SELECT s.*, u.full_name, k.code AS class_code, k.name AS class_name, c.name AS course FROM students s JOIN users u ON u.id = s.user_id
              JOIN classes k ON k.id = s.class_id JOIN courses c ON c.id = k.course_id WHERE s.id = ?', [$sid]);
$units = ReportService::studentReport($sid);
$held = array_sum(array_column($units, 'held'));
$attended = array_sum(array_column($units, 'attended'));
$overall = $held ? round(100 * $attended / $held, 1) : null;
$min = (float)setting('min_attendance_percent', '75');
$belowUnits = array_filter($units, fn($u) => $u['percent'] !== null && $u['percent'] < $min);
$recent = array_slice(ReportService::studentHistory($sid), 0, 6);
$fingers = (int)db_value('SELECT COUNT(*) FROM biometric_templates WHERE student_id = ?', [$sid]);

$pageTitle = 'Student Dashboard';
$active = 'dashboard';
$scripts = ['assets/vendor/chartjs/chart.umd.min.js', 'assets/js/charts.js'];
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="hero d-flex flex-wrap align-items-center gap-3">
  <div class="me-auto">
    <div class="hero-meta"><i class="bi bi-mortarboard"></i> <?= e($me['admission_no']) ?> · <?= e($me['course']) ?> · <?= e($me['class_code']) ?></div>
    <h2><?= greeting() ?>, <?= e(first_name($me['full_name'])) ?> 👋</h2>
    <p><?= $overall === null ? 'No attendance has been recorded for you yet.' : 'Your overall attendance is ' . e($overall) . '% (minimum required ' . e($min) . '%).' ?></p>
  </div>
  <div class="hero-actions d-flex flex-wrap gap-2 align-items-center">
    <span class="hero-meta mb-0"><i class="bi bi-fingerprint"></i> <?= $fingers ? 'Fingerprint enrolled' : 'Fingerprint not enrolled – visit the administrator' ?></span>
    <a href="<?= url('student/attendance.php') ?>" class="btn btn-light"><i class="bi bi-calendar-check me-1"></i> My attendance</a>
  </div>
</div>
<?php if ($belowUnits): ?>
  <div class="alert alert-danger"><i class="bi bi-exclamation-triangle"></i> Your attendance is below the required <?= e($min) ?>% in <?= count($belowUnits) ?> unit(s):
    <?= e(implode(', ', array_map(fn($u) => $u['code'] . ' (' . $u['percent'] . '%)', $belowUnits))) ?>. Attend all remaining classes to remain eligible for examinations.</div>
<?php endif; ?>
<div class="row g-3 mb-3">
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-<?= $overall === null || $overall >= $min ? 'green' : 'red' ?>"><i class="bi bi-graph-up"></i></div><div><div class="stat-value"><?= $overall === null ? '—' : e($overall) . '%' ?></div><div class="stat-label">Overall attendance</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-blue"><i class="bi bi-book"></i></div><div><div class="stat-value"><?= count($units) ?></div><div class="stat-label">Registered units</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-navy"><i class="bi bi-check2-square"></i></div><div><div class="stat-value"><?= $attended ?>/<?= $held ?></div><div class="stat-label">Sessions attended</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-amber"><i class="bi bi-alarm"></i></div><div><div class="stat-value"><?= array_sum(array_column($units, 'late')) ?></div><div class="stat-label">Times late</div></div></div></div>
</div>
<div class="row g-3">
  <div class="col-lg-7"><div class="card h-100"><div class="card-header">Attendance by unit (minimum <?= e($min) ?>%)</div><div class="card-body"><canvas id="chart" height="150"></canvas></div></div></div>
  <div class="col-lg-5"><div class="card h-100"><div class="card-header d-flex">Recent attendance<a class="ms-auto small" href="<?= url('student/attendance.php') ?>">View all</a></div>
    <ul class="list-group list-group-flush">
    <?php foreach ($recent as $r): ?>
      <li class="list-group-item d-flex"><div><div class="fw-semibold"><?= e($r['code']) ?> <span class="fw-normal small"><?= e($r['name']) ?></span></div><div class="small text-muted"><?= e(fmt_date($r['session_date'])) ?> <?= fmt_time($r['start_time']) ?></div></div>
        <div class="ms-auto"><?= status_badge($r['status']) ?></div></li>
    <?php endforeach; ?>
    <?php if (!$recent): ?><li class="list-group-item text-muted">No attendance recorded yet.</li><?php endif; ?>
    </ul></div></div>
</div>
<script>
document.addEventListener('DOMContentLoaded', () => {
  const u = <?= json_encode(array_values($units)) ?>, min = <?= json_encode($min) ?>;
  new Chart(document.getElementById('chart'), { type: 'bar', data: { labels: u.map(r => r.code), datasets: [
    { label: 'Attendance %', data: u.map(r => r.percent), backgroundColor: u.map(r => r.percent !== null && r.percent < min ? '#c0392b' : '#1f6feb'), borderRadius: 4 },
    { type: 'line', label: 'Minimum', data: u.map(() => min), borderColor: '#0b1f3a', borderDash: [6, 4], pointRadius: 0 }] },
    options: { scales: { y: { min: 0, max: 100 } } } });
});
</script>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
