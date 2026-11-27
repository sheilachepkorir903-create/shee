<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('student');

$sid = Auth::studentId();
if (is_post()) {
    verify_csrf();
    $d = ['email' => input('email'), 'phone' => input('phone')];
    $errors = validate($d, ['email' => 'email|max:120', 'phone' => 'phone']);
    if ($errors) {
        flash('danger', implode(' ', $errors));
    } else {
        try {
            db_query('UPDATE users SET email = ?, phone = ? WHERE id = ?', [$d['email'] ?: null, $d['phone'] ?: null, Auth::id()]);
            audit('profile_updated', 'user', Auth::id());
            flash('success', 'Contact details updated.');
        } catch (PDOException $e) {
            if (!is_duplicate_error($e)) throw $e;
            flash('danger', 'That email address is already used by another account.');
        }
    }
    redirect('student/profile.php');
}
$me = db_one('SELECT s.*, u.full_name, u.email, u.phone, u.last_login_at, k.code AS class_code, k.name AS class_name, c.name AS course, d.name AS department
              FROM students s JOIN users u ON u.id = s.user_id JOIN classes k ON k.id = s.class_id JOIN courses c ON c.id = k.course_id
              JOIN departments d ON d.id = c.department_id WHERE s.id = ?', [$sid]);
$fingers = db_all('SELECT finger, enrolled_at, driver FROM biometric_templates WHERE student_id = ?', [$sid]);
$consent = db_one('SELECT given_at, consent_version FROM biometric_consents WHERE student_id = ? AND withdrawn_at IS NULL ORDER BY id DESC LIMIT 1', [$sid]);
$pageTitle = 'My Profile';
$active = 'profile';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="row g-3">
  <div class="col-lg-7"><div class="card"><div class="card-header"><i class="bi bi-person-badge me-1"></i> Personal details</div><div class="card-body">
    <dl class="row mb-0">
      <dt class="col-sm-4">Full name</dt><dd class="col-sm-8"><?= e($me['full_name']) ?></dd>
      <dt class="col-sm-4">Admission number</dt><dd class="col-sm-8"><?= e($me['admission_no']) ?></dd>
      <dt class="col-sm-4">Gender</dt><dd class="col-sm-8"><?= e($me['gender'] ?? '—') ?></dd>
      <dt class="col-sm-4">Course</dt><dd class="col-sm-8"><?= e($me['course']) ?></dd>
      <dt class="col-sm-4">Department</dt><dd class="col-sm-8"><?= e($me['department']) ?></dd>
      <dt class="col-sm-4">Class</dt><dd class="col-sm-8"><?= e($me['class_code'] . ' – ' . $me['class_name']) ?></dd>
      <dt class="col-sm-4">Status</dt><dd class="col-sm-8"><?= status_badge($me['status']) ?></dd>
      <dt class="col-sm-4">Last login</dt><dd class="col-sm-8"><?= e(fmt_date($me['last_login_at'], 'd M Y H:i')) ?></dd>
    </dl>
    <hr><form method="post" class="row g-2"><?= csrf_field() ?>
      <div class="col-md-6"><label class="form-label">Email</label><input type="email" name="email" value="<?= e($me['email'] ?? '') ?>" class="form-control" maxlength="120"></div>
      <div class="col-md-6"><label class="form-label">Phone</label><input name="phone" value="<?= e($me['phone'] ?? '') ?>" class="form-control" maxlength="15"></div>
      <div class="col-12"><button class="btn btn-primary btn-sm">Update contact details</button> <span class="small text-muted">Other changes must be made by the administrator.</span></div>
    </form>
  </div></div></div>
  <div class="col-lg-5"><div class="card"><div class="card-header"><i class="bi bi-fingerprint me-1"></i> My biometric data</div><div class="card-body">
    <p class="small">Consent: <?= $consent ? 'given on ' . e(fmt_date($consent['given_at'])) . ' (notice v' . e($consent['consent_version']) . ')' : 'not given' ?></p>
    <ul class="small"><?php foreach ($fingers as $f): ?><li><?= e(FINGERS[$f['finger']]) ?> – enrolled <?= e(fmt_date($f['enrolled_at'])) ?></li><?php endforeach; ?>
      <?php if (!$fingers): ?><li>No fingerprints enrolled.</li><?php endif; ?></ul>
    <p class="small text-muted mb-0">Only an encrypted template of your fingerprint is stored, never the image. It is used only to record your attendance. Under the Data Protection Act, 2019 you may ask the administrator to delete it at any time; your lecturer will then record your attendance manually.</p>
  </div></div></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
