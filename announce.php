<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

if (is_post()) {
    verify_csrf();
    $d = ['title' => input('title'), 'message' => input('message'), 'audience' => input('audience'), 'type' => input('type')];
    $errors = validate($d, ['title' => 'required|max:120', 'message' => 'required|max:500', 'audience' => 'required', 'type' => 'required|in:info,warning,success,danger']);
    if (!preg_match('/^(all|admin|lecturer|student|class:\d+)$/', $d['audience'])) $errors['audience'] = 'Select a valid audience.';
    if ($errors) {
        flash('danger', implode(' ', $errors));
    } else {
        if (str_starts_with($d['audience'], 'class:')) {
            $users = db_all('SELECT s.user_id AS id FROM students s WHERE s.class_id = ?', [(int)substr($d['audience'], 6)]);
        } elseif ($d['audience'] === 'all') {
            $users = db_all('SELECT id FROM users WHERE is_active = 1');
        } else {
            $users = db_all('SELECT id FROM users WHERE is_active = 1 AND role = ?', [$d['audience']]);
        }
        foreach ($users as $u) notify((int)$u['id'], $d['title'], $d['message'], $d['type']);
        audit('announcement_sent', 'notification', null, $d['audience'] . ': ' . $d['title'] . ' (' . count($users) . ' recipients)');
        flash('success', 'Announcement sent to ' . count($users) . ' user(s).');
    }
    redirect('admin/announce.php');
}
$classes = db_all('SELECT id, code FROM classes ORDER BY code');
$recent = db_all("SELECT details, created_at FROM audit_logs WHERE action = 'announcement_sent' ORDER BY id DESC LIMIT 10");
$pageTitle = 'Announcements';
$active = 'announce';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="row g-3">
  <div class="col-lg-7"><div class="card"><div class="card-header"><i class="bi bi-megaphone me-1"></i> Send an in-system announcement</div><div class="card-body">
    <form method="post"><?= csrf_field() ?>
      <div class="row g-3">
        <div class="col-md-7"><label class="form-label">Audience</label><select name="audience" class="form-select">
          <option value="all">All users</option><option value="student">All students</option><option value="lecturer">All lecturers</option><option value="admin">Administrators</option>
          <?php foreach ($classes as $c): ?><option value="class:<?= (int)$c['id'] ?>">Class <?= e($c['code']) ?></option><?php endforeach; ?></select></div>
        <div class="col-md-5"><label class="form-label">Type</label><select name="type" class="form-select"><option value="info">Information</option><option value="warning">Warning</option><option value="success">Success</option><option value="danger">Urgent</option></select></div>
        <div class="col-12"><label class="form-label">Title</label><input name="title" class="form-control" required maxlength="120"></div>
        <div class="col-12"><label class="form-label">Message</label><textarea name="message" class="form-control" rows="4" required maxlength="500"></textarea></div>
      </div>
      <button class="btn btn-primary mt-3"><i class="bi bi-send"></i> Send</button>
    </form></div></div></div>
  <div class="col-lg-5"><div class="card"><div class="card-header">Recently sent</div><ul class="list-group list-group-flush small">
    <?php foreach ($recent as $r): ?><li class="list-group-item"><?= e($r['details']) ?><div class="text-muted"><?= e(fmt_date($r['created_at'], 'd M Y H:i')) ?></div></li><?php endforeach; ?>
    <?php if (!$recent): ?><li class="list-group-item text-muted">None yet.</li><?php endif; ?></ul></div></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
