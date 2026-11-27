<?php
require __DIR__ . '/app/bootstrap.php';
require_role('admin', 'lecturer', 'student');

if (is_post()) {
    verify_csrf();
    if (isset($_POST['mark_all'])) {
        db_query('UPDATE notifications SET is_read = 1 WHERE user_id = ?', [Auth::id()]);
    } elseif ($id = input_int('id')) {
        db_query('UPDATE notifications SET is_read = 1 WHERE id = ? AND user_id = ?', [$id, Auth::id()]);
    }
    redirect('notifications.php');
}
$items = db_all('SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 100', [Auth::id()]);
$pageTitle = 'Notifications';
$active = '';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex align-items-center">
    <span><i class="bi bi-bell me-1"></i> Your notifications</span>
    <form method="post" class="ms-auto"><?= csrf_field() ?><button name="mark_all" value="1" class="btn btn-sm btn-outline-primary">Mark all as read</button></form>
  </div>
  <ul class="list-group list-group-flush">
    <?php if (!$items): ?><li class="list-group-item text-muted py-4 text-center">No notifications yet.</li><?php endif; ?>
    <?php foreach ($items as $n): ?>
      <li class="list-group-item d-flex gap-3 <?= $n['is_read'] ? '' : 'bg-light' ?>">
        <i class="bi bi-<?= ['warning' => 'exclamation-triangle text-warning', 'danger' => 'x-octagon text-danger', 'success' => 'check-circle text-success'][$n['type']] ?? 'info-circle text-primary' ?> fs-4"></i>
        <div class="flex-grow-1">
          <div class="fw-semibold"><?= e($n['title']) ?> <?php if (!$n['is_read']): ?><span class="badge text-bg-primary ms-1">New</span><?php endif; ?></div>
          <div><?= e($n['message']) ?></div>
          <div class="small text-muted"><?= e(fmt_date($n['created_at'], 'd M Y H:i')) ?></div>
        </div>
        <?php if (!$n['is_read']): ?>
          <form method="post"><?= csrf_field() ?><input type="hidden" name="id" value="<?= (int)$n['id'] ?>"><button class="btn btn-sm btn-light" title="Mark as read"><i class="bi bi-check2"></i></button></form>
        <?php endif; ?>
      </li>
    <?php endforeach; ?>
  </ul>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
