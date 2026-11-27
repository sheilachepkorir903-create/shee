<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer');

$sessionId = input_int('session', 'GET');
$s = AttendanceService::session($sessionId);
if (!$s || (int)$s['lecturer_id'] !== Auth::lecturerId()) {
    flash('danger', 'Session not found.');
    redirect('lecturer/sessions.php');
}
if ($s['status'] !== 'open') {
    flash('warning', 'This session is not open. Open it first.');
    redirect('lecturer/sessions.php');
}

// Manual marking (FR-28) from the station
if (is_post()) {
    verify_csrf();
    $r = AttendanceService::manualMark($sessionId, input_int('student_id'), input('status', 'present'), input('reason'), Auth::id());
    flash($r['ok'] ? 'success' : 'danger', $r['message']);
    redirect('lecturer/station.php?session=' . $sessionId);
}

$driver = setting('biometric_driver', 'simulated');
$roster = db_all('SELECT s.id, s.admission_no, u.full_name, (SELECT GROUP_CONCAT(bt.finger) FROM biometric_templates bt WHERE bt.student_id = s.id AND bt.driver = ?) AS fingers
                  FROM enrollments e JOIN students s ON s.id = e.student_id JOIN users u ON u.id = s.user_id
                  WHERE e.assignment_id = ? ORDER BY s.admission_no', [$driver === 'bridge' ? 'hardware' : 'simulated', $s['assignment_id']]);
// A student who is NOT registered for this unit (for the simulated "wrong unit" test)
$outsider = db_one('SELECT s.id, s.admission_no FROM students s WHERE s.id NOT IN (SELECT student_id FROM enrollments WHERE assignment_id = ?)
                    AND s.id IN (SELECT student_id FROM biometric_templates) LIMIT 1', [$s['assignment_id']]);
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Attendance Station · <?= e($s['unit_code']) ?></title>
  <link rel="icon" href="<?= url('assets/img/logo.svg') ?>">
  <link rel="stylesheet" href="<?= url('assets/vendor/bootstrap/css/bootstrap.min.css') ?>">
  <link rel="stylesheet" href="<?= url('assets/vendor/bootstrap-icons/bootstrap-icons.min.css') ?>">
  <link rel="stylesheet" href="<?= url('assets/css/app.css') ?>?v=<?= filemtime(BSAMS_ROOT . '/assets/css/app.css') ?>">
  <meta name="csrf-token" content="<?= e(csrf_token()) ?>"><meta name="base-url" content="<?= e(config('base_url')) ?>">
</head>
<body class="station">
<?php if ($driver === 'simulated'): ?><div class="sim-banner"><i class="bi bi-cpu"></i> SIMULATION MODE – fingerprint results are simulated for testing, not real biometric verification</div><?php endif; ?>
<div class="container-fluid py-3 px-lg-4">
  <div class="d-flex flex-wrap align-items-center gap-2 mb-3">
    <img src="<?= url('assets/img/logo.svg') ?>" width="40" alt="">
    <div><div class="fs-4 fw-bold"><?= e($s['unit_code'] . ' · ' . $s['unit_name']) ?></div>
      <div class="text-white-50"><?= e($s['class_code']) ?> · <?= e($s['lecturer_name']) ?> · <?= e(fmt_date($s['session_date'])) ?> <?= fmt_time($s['start_time']) ?>–<?= fmt_time($s['end_time']) ?> <?= $s['venue'] ? '· ' . e($s['venue']) : '' ?></div></div>
    <div class="ms-auto d-flex gap-2">
      <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#manualModal"><i class="bi bi-pencil-square"></i> Manual mark</button>
      <a href="<?= url('lecturer/sessions.php') ?>" class="btn btn-outline-light"><i class="bi bi-arrow-left"></i> Sessions</a>
      <form method="post" action="<?= url('lecturer/sessions.php') ?>" onsubmit="return confirm('Close the session? Students not yet scanned will be marked absent.')">
        <?= csrf_field() ?><input type="hidden" name="action" value="close"><input type="hidden" name="id" value="<?= $sessionId ?>">
        <button class="btn btn-danger"><i class="bi bi-stop-circle"></i> Close session</button></form>
    </div>
  </div>
  <?php foreach (take_flashes() as $f): ?><div class="alert alert-<?= e($f['type']) ?> py-2"><?= e($f['message']) ?></div><?php endforeach; ?>

  <div class="row g-3">
    <div class="col-lg-7">
      <div class="panel p-4 text-center h-100">
        <div class="fs-5 mb-3">Place your finger on the scanner</div>
        <button class="scan-btn border-0" id="scanBtn" type="button"><i class="bi bi-fingerprint"></i></button>
        <?php if ($driver === 'bridge'): ?>
          <div class="form-check form-switch d-inline-block mt-3"><input class="form-check-input" type="checkbox" id="auto" checked><label class="form-check-label" for="auto">Continuous scanning</label></div>
        <?php else: ?>
          <div class="mt-4 mx-auto text-start" style="max-width:520px">
            <label class="form-label text-warning"><i class="bi bi-cpu"></i> Virtual scanner – choose whose finger is placed:</label>
            <select id="simWho" class="form-select">
              <optgroup label="Students registered for this unit">
                <?php foreach ($roster as $r): ?>
                  <?php if ($r['fingers']): foreach (explode(',', $r['fingers']) as $f): ?>
                    <option value="student:<?= (int)$r['id'] ?>:<?= e($f) ?>"><?= e($r['admission_no'] . ' – ' . $r['full_name'] . ' (' . (FINGERS[$f] ?? $f) . ')') ?></option>
                  <?php endforeach; else: ?>
                    <option value="student:<?= (int)$r['id'] ?>:R_INDEX"><?= e($r['admission_no'] . ' – ' . $r['full_name'] . ' (NOT enrolled)') ?></option>
                  <?php endif; ?>
                <?php endforeach; ?>
              </optgroup>
              <optgroup label="Test cases">
                <option value="unknown">Unregistered person's finger</option>
                <?php if ($outsider): ?><option value="student:<?= (int)$outsider['id'] ?>:R_INDEX">Student not registered for this unit (<?= e($outsider['admission_no']) ?>)</option><?php endif; ?>
                <option value="poor">Poor-quality scan</option>
              </optgroup>
            </select>
          </div>
        <?php endif; ?>
        <div id="result" class="result-box mt-4 d-flex align-items-center justify-content-center bg-transparent border border-secondary text-white-50">Waiting for scan…</div>
      </div>
    </div>
    <div class="col-lg-5">
      <div class="panel p-3 h-100">
        <div class="d-flex align-items-end mb-2">
          <div><div class="text-white-50 small">PRESENT</div><div class="display-5 fw-bold"><span id="present">0</span><span class="fs-4 text-white-50"> / <span id="enrolled"><?= count($roster) ?></span></span></div></div>
          <div class="ms-auto text-end"><div class="text-white-50 small">TIME</div><div class="fs-3" id="clock"><?= date('H:i:s') ?></div></div>
        </div>
        <div class="progress mb-3 bg-secondary"><div class="progress-bar bg-success" id="bar" style="width:0%"></div></div>
        <ul class="list-group list-group-flush live-list" id="live"></ul>
      </div>
    </div>
  </div>
</div>

<div class="modal fade text-dark" id="manualModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Manual attendance (fallback)</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body"><?= csrf_field() ?>
    <p class="small text-muted">Use only when a student's fingerprint cannot be read or the student has not consented to biometrics. The record is flagged as manual and logged.</p>
    <div class="mb-2"><label class="form-label">Student</label><select name="student_id" class="form-select" required>
      <?php foreach ($roster as $r): ?><option value="<?= (int)$r['id'] ?>"><?= e($r['admission_no'] . ' – ' . $r['full_name']) ?></option><?php endforeach; ?></select></div>
    <div class="mb-2"><label class="form-label">Status</label><select name="status" class="form-select"><option value="present">Present</option><option value="late">Late</option><option value="absent">Absent</option></select></div>
    <div class="mb-2"><label class="form-label">Reason (required)</label><input name="reason" class="form-control" required minlength="5" maxlength="255" placeholder="e.g. Finger injured, identity confirmed with student ID"></div>
  </div>
  <div class="modal-footer"><button class="btn btn-primary">Save</button></div>
</form></div></div>

<script src="<?= url('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
<script src="<?= url('assets/js/app.js') ?>"></script>
<script src="<?= url('assets/js/scanner.js') ?>"></script>
<script>
(() => {
  const SESSION = <?= $sessionId ?>;
  const DRIVER = <?= json_encode($driver) ?>;
  BSAMSScanner.init(DRIVER, <?= json_encode(setting('bridge_url')) ?>);
  const btn = document.getElementById('scanBtn'), box = document.getElementById('result');
  let busy = false;

  function show(kind, html) {
    box.className = 'result-box mt-4 d-flex align-items-center justify-content-center result-' + kind;
    box.innerHTML = html;
  }
  function esc(s) { const d = document.createElement('div'); d.textContent = s ?? ''; return d.innerHTML; }
  function render(live) {
    document.getElementById('present').textContent = live.present;
    document.getElementById('enrolled').textContent = live.enrolled;
    document.getElementById('bar').style.width = (live.enrolled ? 100 * live.present / live.enrolled : 0) + '%';
    document.getElementById('live').innerHTML = live.records.map(r =>
      '<li class="list-group-item bg-transparent text-white border-secondary d-flex"><div><div class="fw-semibold">' + esc(r.name) + '</div><div class="small text-white-50">' + esc(r.adm) +
      ' · ' + esc(r.method) + '</div></div><div class="ms-auto text-end"><span class="badge text-bg-' + (r.status === 'late' ? 'warning' : 'success') + '">' + esc(r.status) + '</span><div class="small">' + esc(r.time) + '</div></div></li>').join('')
      || '<li class="list-group-item bg-transparent text-white-50 border-0">No students marked yet.</li>';
    if (live.status !== 'open') { show('error', 'This session has been closed.'); btn.disabled = true; }
  }

  async function scan() {
    if (busy) return;
    busy = true; btn.classList.add('scanning');
    show('retry', '<span><i class="bi bi-hourglass-split"></i> Reading fingerprint…</span>');
    const who = document.getElementById('simWho')?.value || 'unknown';
    const cap = await BSAMSScanner.capture({ identity: who === 'poor' ? 'unknown' : who, poor: who === 'poor' });
    if (!cap.ok) { show('error', esc(cap.message)); return finish(); }
    let r;
    try { r = await BSAMS.post('api/scan.php', { session_id: SESSION, template: cap.template, quality: cap.quality }); }
    catch (e) { show('error', 'Network error. Check the connection to the server.'); return finish(); }
    const icon = { success: 'check-circle-fill', duplicate: 'exclamation-circle-fill', rejected: 'x-octagon-fill', retry: 'arrow-repeat', error: 'exclamation-triangle-fill' }[r.result] || 'info-circle';
    const who2 = r.student ? '<div class="fs-3 fw-bold">' + esc(r.student.full_name) + '</div><div>' + esc(r.student.admission_no) + '</div>' : '';
    show(r.result || 'error', '<div><i class="bi bi-' + icon + ' fs-1"></i>' + who2 + '<div class="mt-1">' + esc(r.message) + '</div>' +
      (r.score ? '<div class="small opacity-75">Match score ' + r.score + (r.simulated ? ' (simulated)' : '') + ' · ' + r.match_ms + ' ms</div>' : '') + '</div>');
    if (r.live) render(r.live);
    finish();
  }
  function finish() {
    btn.classList.remove('scanning'); busy = false;
    const auto = document.getElementById('auto');
    if (DRIVER === 'bridge' && auto && auto.checked) setTimeout(scan, 2000);
  }
  btn.addEventListener('click', scan);
  async function refresh() { try { const d = await BSAMS.get('api/live.php?session_id=' + SESSION); if (d.ok) render(d); } catch (e) {} }
  refresh(); setInterval(refresh, 5000);
  const OFFSET = <?= time() * 1000 ?> - Date.now(); // use the server's clock (records are stamped with server time)
  const TZ = <?= json_encode(config('timezone')) ?>;
  setInterval(() => { document.getElementById('clock').textContent = new Date(Date.now() + OFFSET).toLocaleTimeString('en-GB', { timeZone: TZ }); }, 1000);
  if (DRIVER === 'bridge' && document.getElementById('auto')?.checked) scan();
})();
</script>
</body>
</html>
