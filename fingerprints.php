<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$studentId = input_int('student', 'GET');
if (is_post()) {
    verify_csrf();
    $sid = input_int('student_id');
    if (input('action') === 'consent') {
        if (input('agree') !== '1') {
            flash('danger', 'Tick the box to confirm that the student has read and accepted the biometric data notice.');
        } else {
            AttendanceService::recordConsent($sid, Auth::id());
            flash('success', 'Consent recorded. You can now enrol fingerprints.');
        }
    } elseif (input('action') === 'withdraw') {
        $n = AttendanceService::withdrawConsent($sid);
        flash('success', "Consent withdrawn and $n fingerprint template(s) permanently deleted.");
    } elseif (input('action') === 'delete_finger') {
        db_query('DELETE FROM biometric_templates WHERE id = ? AND student_id = ?', [input_int('template_id'), $sid]);
        audit('fingerprint_deleted', 'student', $sid);
        flash('success', 'Fingerprint template deleted.');
    }
    redirect('admin/fingerprints.php?student=' . $sid);
}

$pageTitle = 'Fingerprint Enrolment';
$active = 'fingerprints';

if (!$studentId) {
    $classFilter = input_int('class', 'GET');
    $classes = db_all('SELECT id, code FROM classes ORDER BY code');
    $sql = "SELECT s.id, s.admission_no, u.full_name, k.code AS class_code,
                   (SELECT COUNT(*) FROM biometric_templates bt WHERE bt.student_id = s.id) AS fingers,
                   (SELECT COUNT(*) FROM biometric_consents bc WHERE bc.student_id = s.id AND bc.withdrawn_at IS NULL) AS consent
            FROM students s JOIN users u ON u.id = s.user_id JOIN classes k ON k.id = s.class_id WHERE s.status = 'active'";
    $rows = $classFilter ? db_all($sql . ' AND s.class_id = ? ORDER BY s.admission_no', [$classFilter]) : db_all($sql . ' ORDER BY s.admission_no');
    $done = count(array_filter($rows, fn($r) => $r['fingers'] > 0));
    require BSAMS_ROOT . '/app/layout/header.php';
    ?>
    <div class="row g-3 mb-3">
      <div class="col-md-4"><div class="card stat-card"><div class="stat-icon bg-soft-blue"><i class="bi bi-people"></i></div><div><div class="stat-value"><?= count($rows) ?></div><div class="stat-label">Active students</div></div></div></div>
      <div class="col-md-4"><div class="card stat-card"><div class="stat-icon bg-soft-green"><i class="bi bi-fingerprint"></i></div><div><div class="stat-value"><?= $done ?></div><div class="stat-label">Fingerprints enrolled</div></div></div></div>
      <div class="col-md-4"><div class="card stat-card"><div class="stat-icon bg-soft-red"><i class="bi bi-exclamation-diamond"></i></div><div><div class="stat-value"><?= count($rows) - $done ?></div><div class="stat-label">Not yet enrolled</div></div></div></div>
    </div>
    <div class="card">
      <div class="card-header d-flex flex-wrap gap-2 align-items-center">
        <span><i class="bi bi-fingerprint me-1"></i> Select a student to enrol</span>
        <form class="ms-auto" method="get"><select name="class" class="form-select form-select-sm" onchange="this.form.submit()"><option value="0">All classes</option>
          <?php foreach ($classes as $c): ?><option value="<?= (int)$c['id'] ?>" <?= $classFilter === (int)$c['id'] ? 'selected' : '' ?>><?= e($c['code']) ?></option><?php endforeach; ?></select></form>
        <input class="form-control form-control-sm table-search" placeholder="Search…" data-table-search="#tbl">
      </div>
      <div class="table-responsive"><table class="table table-hover mb-0" id="tbl">
        <thead><tr><th>Admission No.</th><th>Name</th><th>Class</th><th>Consent</th><th>Fingers</th><th></th></tr></thead>
        <tbody>
        <?php foreach ($rows as $r): ?>
          <tr><td class="fw-semibold"><?= e($r['admission_no']) ?></td><td><?= e($r['full_name']) ?></td><td><?= e($r['class_code']) ?></td>
            <td><?= $r['consent'] ? '<span class="badge text-bg-success">Given</span>' : '<span class="badge text-bg-light text-muted">None</span>' ?></td>
            <td><?= $r['fingers'] ? '<span class="badge text-bg-success">' . (int)$r['fingers'] . '</span>' : '<span class="badge text-bg-danger">0</span>' ?></td>
            <td class="text-end"><a class="btn btn-sm btn-primary" href="<?= url('admin/fingerprints.php?student=' . (int)$r['id']) ?>"><i class="bi bi-fingerprint"></i> Enrol</a></td></tr>
        <?php endforeach; ?>
        </tbody></table></div>
    </div>
    <?php
    require BSAMS_ROOT . '/app/layout/footer.php';
    exit;
}

$st = db_one('SELECT s.*, u.full_name, k.code AS class_code FROM students s JOIN users u ON u.id = s.user_id JOIN classes k ON k.id = s.class_id WHERE s.id = ?', [$studentId]);
if (!$st) redirect('admin/fingerprints.php');
$consent = db_one('SELECT bc.*, u.full_name AS recorder FROM biometric_consents bc JOIN users u ON u.id = bc.recorded_by WHERE bc.student_id = ? AND bc.withdrawn_at IS NULL ORDER BY bc.id DESC LIMIT 1', [$studentId]);
$templates = db_all('SELECT id, finger, driver, quality, enrolled_at FROM biometric_templates WHERE student_id = ? ORDER BY enrolled_at', [$studentId]);
$other = db_one('SELECT id FROM students WHERE id <> ? AND id IN (SELECT student_id FROM biometric_templates) LIMIT 1', [$studentId]);
$driver = setting('biometric_driver', 'simulated');
$scripts = ['assets/js/scanner.js'];
require BSAMS_ROOT . '/app/layout/header.php';
?>
<a href="<?= url('admin/fingerprints.php') ?>" class="btn btn-sm btn-light mb-3"><i class="bi bi-arrow-left"></i> All students</a>
<?php if ($driver === 'simulated'): ?>
  <div class="alert alert-warning"><i class="bi bi-cpu"></i> <strong>SIMULATION MODE.</strong> Fingerprints are produced by the virtual scanner for development and testing. This is not real biometric enrolment. Switch the driver to <em>Hardware bridge</em> in Settings when a scanner is connected.</div>
<?php endif; ?>
<div class="row g-3">
  <div class="col-lg-5">
    <div class="card mb-3"><div class="card-body d-flex gap-3 align-items-center">
      <span class="avatar" style="width:56px;height:56px;font-size:1.4rem"><?= e(mb_substr($st['full_name'], 0, 1)) ?></span>
      <div><div class="fw-bold fs-5"><?= e($st['full_name']) ?></div><div class="text-muted"><?= e($st['admission_no']) ?> · <?= e($st['class_code']) ?></div></div>
    </div></div>

    <div class="card mb-3">
      <div class="card-header"><i class="bi bi-file-earmark-check me-1"></i> Consent (Data Protection Act, 2019)</div>
      <div class="card-body">
        <?php if ($consent): ?>
          <p class="mb-2"><span class="badge text-bg-success">Consent given</span> on <?= e(fmt_date($consent['given_at'], 'd M Y H:i')) ?> (notice v<?= e($consent['consent_version']) ?>), recorded by <?= e($consent['recorder']) ?>.</p>
          <form method="post" data-confirm="Withdraw consent and permanently delete ALL fingerprint templates of this student?">
            <?= csrf_field() ?><input type="hidden" name="action" value="withdraw"><input type="hidden" name="student_id" value="<?= $studentId ?>">
            <button class="btn btn-sm btn-outline-danger"><i class="bi bi-x-octagon"></i> Withdraw consent &amp; delete templates</button>
          </form>
        <?php else: ?>
          <div class="small bg-light border rounded p-3 mb-3">
            <strong>Biometric data notice (v<?= e(setting('consent_version', '1.0')) ?>).</strong> The institution will capture your fingerprints only to record class attendance.
            Fingerprint images are not stored; only an encrypted mathematical template is kept. Templates are never shared with third parties and are deleted when you leave the
            institution or withdraw consent. You may withdraw consent at any time and have your attendance recorded manually by your lecturer instead.
          </div>
          <form method="post"><?= csrf_field() ?><input type="hidden" name="action" value="consent"><input type="hidden" name="student_id" value="<?= $studentId ?>">
            <div class="form-check mb-2"><input class="form-check-input" type="checkbox" name="agree" value="1" id="agree"><label class="form-check-label" for="agree">The student has read the notice and agrees to fingerprint enrolment.</label></div>
            <button class="btn btn-primary btn-sm">Record consent</button></form>
        <?php endif; ?>
      </div>
    </div>

    <div class="card">
      <div class="card-header"><i class="bi bi-list-check me-1"></i> Enrolled fingers (<?= count($templates) ?>)</div>
      <ul class="list-group list-group-flush">
        <?php foreach ($templates as $t): ?>
          <li class="list-group-item d-flex align-items-center gap-2">
            <i class="bi bi-fingerprint text-success fs-4"></i>
            <div class="flex-grow-1"><div class="fw-semibold"><?= e(FINGERS[$t['finger']]) ?></div>
              <div class="small text-muted">Quality <?= (int)$t['quality'] ?> · <?= status_badge($t['driver']) ?> · <?= e(fmt_date($t['enrolled_at'], 'd M Y H:i')) ?></div></div>
            <form method="post" data-confirm="Delete this fingerprint template?"><?= csrf_field() ?><input type="hidden" name="action" value="delete_finger">
              <input type="hidden" name="student_id" value="<?= $studentId ?>"><input type="hidden" name="template_id" value="<?= (int)$t['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button></form>
          </li>
        <?php endforeach; ?>
        <?php if (!$templates): ?><li class="list-group-item text-muted">No fingerprints enrolled yet. Enrol at least two different fingers.</li><?php endif; ?>
      </ul>
    </div>
  </div>

  <div class="col-lg-7">
    <div class="card">
      <div class="card-header"><i class="bi bi-fingerprint me-1"></i> Capture fingerprint</div>
      <div class="card-body text-center">
        <?php if (!$consent): ?>
          <p class="text-muted my-5">Record the student's consent first.</p>
        <?php else: ?>
          <div class="row g-3 text-start mb-4">
            <div class="col-md-6"><label class="form-label">Finger</label>
              <select id="finger" class="form-select"><?php foreach (FINGERS as $k => $v): ?><option value="<?= $k ?>" <?= $k === 'R_INDEX' ? 'selected' : '' ?>><?= e($v) ?></option><?php endforeach; ?></select></div>
            <?php if ($driver === 'simulated'): ?>
              <div class="col-md-6"><label class="form-label">Virtual scanner – finger placed</label>
                <select id="simWho" class="form-select">
                  <option value="self">This student's selected finger</option>
                  <option value="poor">This student's finger – poor quality</option>
                  <?php if ($other): ?><option value="other">Another student's enrolled finger (duplicate test)</option><?php endif; ?>
                </select></div>
            <?php endif; ?>
          </div>
          <button class="scan-btn border-0" id="scanBtn" type="button" title="Scan"><i class="bi bi-fingerprint"></i></button>
          <p class="text-muted mt-3 mb-2" id="hint">Ask the student to place the selected finger flat on the scanner, then click the button.</p>
          <div id="result" class="mt-3"></div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('scanBtn');
  if (!btn) return;
  BSAMSScanner.init(<?= json_encode($driver) ?>, <?= json_encode(setting('bridge_url')) ?>);
  btn.addEventListener('click', async () => {
    const finger = document.getElementById('finger').value;
    const who = document.getElementById('simWho')?.value || 'self';
    const identity = who === 'other' ? 'student:<?= (int)($other['id'] ?? 0) ?>:R_INDEX' : 'student:<?= $studentId ?>:' + finger;
    const res = document.getElementById('result');
    btn.classList.add('scanning'); btn.disabled = true;
    res.innerHTML = '<div class="text-muted">Scanning…</div>';
    const cap = await BSAMSScanner.capture({ identity, poor: who === 'poor' });
    if (!cap.ok) { done('danger', cap.message); return; }
    const r = await BSAMS.post('api/enroll.php', { student_id: <?= $studentId ?>, finger, template: cap.template, quality: cap.quality });
    done(r.ok ? 'success' : 'danger', r.message, r.ok);
    function done(type, msg, reload) {
      btn.classList.remove('scanning'); btn.disabled = false;
      res.innerHTML = '<div class="alert alert-' + type + ' text-start"></div>';
      res.firstChild.textContent = msg;
      if (reload) setTimeout(() => location.reload(), 1200);
    }
  });
});
</script>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
