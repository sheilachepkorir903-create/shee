<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$stats = [
    'students'  => (int)db_value("SELECT COUNT(*) FROM students WHERE status = 'active'"),
    'lecturers' => (int)db_value('SELECT COUNT(*) FROM lecturers l JOIN users u ON u.id = l.user_id WHERE u.is_active = 1'),
    'units'     => (int)db_value('SELECT COUNT(*) FROM units'),
    'today'     => (int)db_value('SELECT COUNT(*) FROM class_sessions WHERE session_date = CURDATE()'),
    'open'      => (int)db_value("SELECT COUNT(*) FROM class_sessions WHERE status = 'open'"),
    'enrolled'  => (int)db_value("SELECT COUNT(DISTINCT bt.student_id) FROM biometric_templates bt JOIN students s ON s.id = bt.student_id WHERE s.status = 'active'"),
];
$avg = ReportService::averagePercent();
$below = count(ReportService::belowMinimum());
$trend = ReportService::dailyTrend(14);
$byCourse = db_all("SELECT c.code, ROUND(100 * SUM(v.sessions_attended) / NULLIF(SUM(v.sessions_held), 0), 1) AS pct
                    FROM v_attendance_summary v JOIN unit_assignments ua ON ua.id = v.assignment_id
                    JOIN classes k ON k.id = ua.class_id JOIN courses c ON c.id = k.course_id GROUP BY c.code ORDER BY c.code");
$todaySessions = db_all("SELECT cs.*, un.code, un.name, k.code AS class_code, lu.full_name AS lecturer,
                                (SELECT COUNT(*) FROM attendance_records ar WHERE ar.session_id = cs.id AND ar.status IN ('present','late')) AS present,
                                (SELECT COUNT(*) FROM enrollments e WHERE e.assignment_id = cs.assignment_id) AS enrolled
                         FROM class_sessions cs JOIN unit_assignments ua ON ua.id = cs.assignment_id JOIN units un ON un.id = ua.unit_id
                         JOIN classes k ON k.id = ua.class_id JOIN lecturers l ON l.id = ua.lecturer_id JOIN users lu ON lu.id = l.user_id
                         WHERE cs.session_date = CURDATE() ORDER BY cs.start_time");
$recent = db_all('SELECT a.action, a.details, a.created_at, u.full_name FROM audit_logs a LEFT JOIN users u ON u.id = a.user_id ORDER BY a.id DESC LIMIT 8');

$pageTitle = 'Administrator Dashboard';
$active = 'dashboard';
$scripts = ['assets/vendor/chartjs/chart.umd.min.js', 'assets/js/charts.js'];
require BSAMS_ROOT . '/app/layout/header.php';
$cov = $stats['students'] ? round(100 * $stats['enrolled'] / $stats['students']) : 0;
?>
<div class="hero d-flex flex-wrap align-items-center gap-3">
  <div class="me-auto">
    <div class="hero-meta"><i class="bi bi-calendar3"></i> <?= date('l, j F Y') ?> · <?= $stats['today'] ?> session(s) today, <?= $stats['open'] ?> open</div>
    <h2><?= greeting() ?>, <?= e($_SESSION['name'] ?? '') ?> 👋</h2>
    <p>Here is what is happening with attendance across <?= e(setting('institution_name')) ?>.</p>
  </div>
  <div class="hero-actions d-flex flex-wrap gap-2">
    <a href="<?= url('admin/students.php') ?>" class="btn btn-light"><i class="bi bi-person-plus me-1"></i> Register student</a>
    <a href="<?= url('admin/fingerprints.php') ?>" class="btn btn-ghost"><i class="bi bi-fingerprint me-1"></i> Enrol fingerprints</a>
    <a href="<?= url('admin/reports.php') ?>" class="btn btn-ghost"><i class="bi bi-file-earmark-bar-graph me-1"></i> Reports</a>
  </div>
</div>
<div class="row g-3 mb-3">
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-blue"><i class="bi bi-mortarboard"></i></div><div><div class="stat-value"><?= $stats['students'] ?></div><div class="stat-label">Active students</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-navy"><i class="bi bi-person-workspace"></i></div><div><div class="stat-value"><?= $stats['lecturers'] ?></div><div class="stat-label">Lecturers · <?= $stats['units'] ?> units</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-green"><i class="bi bi-graph-up"></i></div><div><div class="stat-value"><?= $avg === null ? '—' : e(number_format($avg, 1)) . '%' ?></div><div class="stat-label">Average attendance</div></div></div></div>
  <div class="col-sm-6 col-xl-3"><div class="card stat-card"><div class="stat-icon bg-soft-red"><i class="bi bi-exclamation-triangle"></i></div><div><div class="stat-value"><?= $below ?></div><div class="stat-label">Below <?= e(setting('min_attendance_percent')) ?>% (student-units)</div></div></div></div>
</div>
<div class="row g-3 mb-3">
  <div class="col-lg-8"><div class="card h-100"><div class="card-header">Attendance in the last 14 days</div><div class="card-body"><canvas id="trend" height="110"></canvas></div></div></div>
  <div class="col-lg-4"><div class="card h-100"><div class="card-header">Fingerprint enrolment coverage</div><div class="card-body">
    <div class="display-6 fw-bold text-navy"><?= $cov ?>%</div>
    <div class="progress my-2"><div class="progress-bar" style="width: <?= $cov ?>%"></div></div>
    <p class="small text-muted"><?= $stats['enrolled'] ?> of <?= $stats['students'] ?> active students have enrolled fingerprints.</p>
    <a href="<?= url('admin/fingerprints.php') ?>" class="btn btn-sm btn-outline-primary">Enrol fingerprints</a>
    <hr><div class="fw-semibold mb-2">Attendance by course</div><canvas id="course" height="160"></canvas>
  </div></div></div>
</div>
<div class="row g-3">
  <div class="col-lg-7"><div class="card h-100"><div class="card-header">Today's sessions (<?= $stats['today'] ?>, <?= $stats['open'] ?> open)</div>
    <div class="table-responsive"><table class="table mb-0"><thead><tr><th>Time</th><th>Unit</th><th>Class</th><th>Lecturer</th><th>Status</th><th>Present</th></tr></thead><tbody>
    <?php foreach ($todaySessions as $s): ?>
      <tr><td><?= fmt_time($s['start_time']) ?>–<?= fmt_time($s['end_time']) ?></td><td><?= e($s['code']) ?></td><td><?= e($s['class_code']) ?></td><td><?= e($s['lecturer']) ?></td>
        <td><?= status_badge($s['status']) ?></td><td><?= (int)$s['present'] ?>/<?= (int)$s['enrolled'] ?></td></tr>
    <?php endforeach; ?>
    <?php if (!$todaySessions): ?><tr><td colspan="6" class="text-muted text-center py-3">No sessions scheduled today.</td></tr><?php endif; ?>
    </tbody></table></div></div></div>
  <div class="col-lg-5"><div class="card h-100"><div class="card-header d-flex">Recent activity<a class="ms-auto small" href="<?= url('admin/audit_logs.php') ?>">View all</a></div>
    <ul class="list-group list-group-flush small">
    <?php foreach ($recent as $r): ?>
      <li class="list-group-item"><span class="fw-semibold"><?= e(str_replace('_', ' ', $r['action'])) ?></span> · <?= e($r['full_name'] ?? 'System') ?>
        <div class="text-muted"><?= e(fmt_date($r['created_at'], 'd M H:i')) ?> <?= e($r['details'] ?? '') ?></div></li>
    <?php endforeach; ?>
    </ul></div></div>
</div>
<script>
document.addEventListener('DOMContentLoaded', () => {
  const t = <?= json_encode($trend) ?>;
  new Chart(document.getElementById('trend'), { type: 'bar', data: { labels: t.labels, datasets: [
    { label: 'Present/Late', data: t.present, backgroundColor: '#1f6feb', borderRadius: 4 },
    { label: 'Absent', data: t.absent, backgroundColor: '#f1aeb5', borderRadius: 4 }] },
    options: { responsive: true, scales: { x: { stacked: true, grid: { display: false } }, y: { stacked: true, beginAtZero: true } } } });
  const c = <?= json_encode($byCourse) ?>;
  new Chart(document.getElementById('course'), { type: 'bar', data: { labels: c.map(r => r.code), datasets: [{ label: 'Attendance %', data: c.map(r => r.pct), backgroundColor: '#0b1f3a', borderRadius: 4 }] },
    options: { indexAxis: 'y', plugins: { legend: { display: false } }, scales: { x: { min: 0, max: 100 } } } });
});
</script>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
