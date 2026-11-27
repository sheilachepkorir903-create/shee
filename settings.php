<?php
require __DIR__ . '/../app/bootstrap.php';
require_once BSAMS_ROOT . '/app/Backup.php';
require_role('admin');

// Download a backup file (name validated strictly to prevent path traversal)
if (($dl = input('download', '', 'GET')) !== '') {
    if (!preg_match('/^bsams_backup_\d{8}_\d{6}\.sql$/', $dl) || !is_file(Backup::dir() . '/' . $dl)) { http_response_code(404); exit('Not found'); }
    audit('backup_downloaded', 'backup', null, $dl);
    header('Content-Type: application/sql');
    header('Content-Disposition: attachment; filename="' . $dl . '"');
    readfile(Backup::dir() . '/' . $dl);
    exit;
}

if (is_post()) {
    verify_csrf();
    if (input('action') === 'save') {
        $d = ['institution_name' => input('institution_name'), 'min_attendance_percent' => input('min_attendance_percent'), 'late_grace_minutes' => input('late_grace_minutes'),
              'biometric_driver' => input('biometric_driver'), 'match_threshold' => input('match_threshold'), 'min_quality' => input('min_quality'),
              'bridge_url' => input('bridge_url'), 'consent_version' => input('consent_version')];
        $errors = validate($d, ['institution_name' => 'required|max:150', 'min_attendance_percent' => 'required|int', 'late_grace_minutes' => 'required|int',
            'biometric_driver' => 'required|in:simulated,bridge', 'match_threshold' => 'required|int', 'min_quality' => 'required|int',
            'bridge_url' => 'required', 'consent_version' => 'required|max:10']);
        if (!preg_match('/^http:\/\/(127\.0\.0\.1|localhost):\d{2,5}$/', $d['bridge_url'])) $errors[] = 'Bridge URL must be http://127.0.0.1:<port> (local service only).';
        if ((int)$d['min_attendance_percent'] < 0 || (int)$d['min_attendance_percent'] > 100) $errors[] = 'Minimum attendance must be 0–100.';
        if ((int)$d['match_threshold'] < 50 || (int)$d['match_threshold'] > 100) $errors[] = 'Match threshold must be between 50 and 100.';
        if ((int)$d['min_quality'] < 0 || (int)$d['min_quality'] > 100) $errors[] = 'Minimum quality must be 0–100.';
        if ((int)$d['late_grace_minutes'] < 0 || (int)$d['late_grace_minutes'] > 180) $errors[] = 'Late grace period must be 0–180 minutes.';
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            $old = setting('biometric_driver');
            foreach ($d as $k => $v) set_setting($k, $v);
            audit('settings_updated', 'settings', null, json_encode($d));
            if ($old !== $d['biometric_driver']) audit('biometric_driver_changed', 'settings', null, "$old -> {$d['biometric_driver']}");
            flash('success', 'Settings saved.');
        }
    } elseif (input('action') === 'backup') {
        $f = Backup::create();
        audit('backup_created', 'backup', null, basename($f));
        flash('success', 'Backup created: ' . basename($f));
    }
    redirect('admin/settings.php');
}

$status = ProviderFactory::make()->status();
$templateCounts = db_all('SELECT driver, COUNT(*) n FROM biometric_templates GROUP BY driver');
$backups = Backup::list();
$pageTitle = 'Settings & Backup';
$active = 'settings';
require BSAMS_ROOT . '/app/layout/header.php';
$s = fn($k) => e(setting($k));
?>
<div class="row g-3">
  <div class="col-lg-7"><div class="card"><div class="card-header"><i class="bi bi-gear me-1"></i> System settings</div><div class="card-body">
    <form method="post"><?= csrf_field() ?><input type="hidden" name="action" value="save">
      <div class="mb-3"><label class="form-label">Institution name</label><input name="institution_name" value="<?= $s('institution_name') ?>" class="form-control" required maxlength="150"></div>
      <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Minimum attendance (%)</label><input type="number" name="min_attendance_percent" min="0" max="100" value="<?= $s('min_attendance_percent') ?>" class="form-control"></div>
        <div class="col-md-6"><label class="form-label">Late after (minutes from start)</label><input type="number" name="late_grace_minutes" min="0" max="180" value="<?= $s('late_grace_minutes') ?>" class="form-control"></div>
      </div>
      <hr><h6 class="text-navy">Biometric module</h6>
      <div class="mb-3"><label class="form-label">Fingerprint driver</label>
        <select name="biometric_driver" class="form-select">
          <option value="simulated" <?= setting('biometric_driver') === 'simulated' ? 'selected' : '' ?>>Simulated scanner (development & testing – NOT real biometrics)</option>
          <option value="bridge" <?= setting('biometric_driver') === 'bridge' ? 'selected' : '' ?>>Hardware bridge (USB scanner via vendor SDK)</option>
        </select>
        <div class="form-text">Templates are stored per driver. Students enrolled with the simulator must be re-enrolled with the real scanner.</div></div>
      <div class="row g-3">
        <div class="col-md-4"><label class="form-label">Match threshold (50–100)</label><input type="number" name="match_threshold" min="50" max="100" value="<?= $s('match_threshold') ?>" class="form-control"></div>
        <div class="col-md-4"><label class="form-label">Minimum capture quality</label><input type="number" name="min_quality" min="0" max="100" value="<?= $s('min_quality') ?>" class="form-control"></div>
        <div class="col-md-4"><label class="form-label">Consent notice version</label><input name="consent_version" value="<?= $s('consent_version') ?>" class="form-control" maxlength="10"></div>
      </div>
      <div class="mt-3"><label class="form-label">Bridge URL (local service)</label><input name="bridge_url" value="<?= $s('bridge_url') ?>" class="form-control" pattern="http://(127\.0\.0\.1|localhost):\d{2,5}"></div>
      <button class="btn btn-primary mt-3">Save settings</button>
    </form></div></div></div>
  <div class="col-lg-5">
    <div class="card mb-3"><div class="card-header"><i class="bi bi-fingerprint me-1"></i> Scanner status</div><div class="card-body">
      <div class="alert alert-<?= $status['ok'] ? (is_simulation() ? 'warning' : 'success') : 'danger' ?> mb-2"><?= e($status['message']) ?></div>
      <div class="small text-muted">Stored templates: <?php foreach ($templateCounts as $t) echo e($t['driver']) . ' ' . (int)$t['n'] . ' · '; ?></div>
    </div></div>
    <div class="card"><div class="card-header d-flex align-items-center"><i class="bi bi-database-down me-1"></i> Database backup
      <form method="post" class="ms-auto"><?= csrf_field() ?><input type="hidden" name="action" value="backup"><button class="btn btn-sm btn-primary"><i class="bi bi-plus-lg"></i> Create backup now</button></form></div>
      <ul class="list-group list-group-flush small">
        <?php foreach (array_slice($backups, 0, 10) as $b): ?>
          <li class="list-group-item d-flex"><span><?= e($b['name']) ?><br><span class="text-muted"><?= date('d M Y H:i', $b['time']) ?> · <?= number_format($b['size'] / 1024, 1) ?> KB</span></span>
            <a class="ms-auto btn btn-sm btn-outline-secondary align-self-center" href="?download=<?= urlencode($b['name']) ?>"><i class="bi bi-download"></i></a></li>
        <?php endforeach; ?>
        <?php if (!$backups): ?><li class="list-group-item text-muted">No backups yet.</li><?php endif; ?>
      </ul>
      <div class="card-footer small text-muted">Backups are saved in storage/backups (not web-accessible). Copy them and the key file storage/keys/biometric.key to separate safe locations regularly.</div>
    </div>
  </div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
