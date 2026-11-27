<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

// Read-only: audit entries cannot be edited or deleted (database triggers also block it).
$action = input('action', '', 'GET');
$userQ = input('user', '', 'GET');
$from = input('from', date('Y-m-d', strtotime('-7 days')), 'GET');
$to = input('to', date('Y-m-d'), 'GET');
$page = max(1, input_int('page', 'GET'));
$per = 50;

$where = 'WHERE a.created_at BETWEEN ? AND ?';
$p = [$from . ' 00:00:00', $to . ' 23:59:59'];
if ($action !== '') { $where .= ' AND a.action = ?'; $p[] = $action; }
if ($userQ !== '') { $where .= ' AND (u.username LIKE ? OR u.full_name LIKE ?)'; $p[] = "%$userQ%"; $p[] = "%$userQ%"; }
$total = (int)db_value("SELECT COUNT(*) FROM audit_logs a LEFT JOIN users u ON u.id = a.user_id $where", $p);
$rows = db_all("SELECT a.*, u.username, u.full_name FROM audit_logs a LEFT JOIN users u ON u.id = a.user_id $where ORDER BY a.id DESC LIMIT $per OFFSET " . (($page - 1) * $per), $p);
$actions = array_column(db_all('SELECT DISTINCT action FROM audit_logs ORDER BY action'), 'action');
if (input('export', '', 'GET') === 'csv') {
    $all = db_all("SELECT a.created_at, u.username, a.action, a.entity_type, a.entity_id, a.details, a.ip_address FROM audit_logs a LEFT JOIN users u ON u.id = a.user_id $where ORDER BY a.id DESC", $p);
    audit('audit_exported', 'audit_log', null, count($all) . ' rows');
    send_csv('bsams_audit_log_' . date('Ymd') . '.csv', ['Time', 'User', 'Action', 'Entity', 'Entity ID', 'Details', 'IP'], $all);
}
$pageTitle = 'Audit Logs';
$active = 'audit';
require BSAMS_ROOT . '/app/layout/header.php';
$pages = max(1, (int)ceil($total / $per));
?>
<form class="card card-body mb-3" method="get">
  <div class="row g-2 align-items-end">
    <div class="col-6 col-md-2"><label class="form-label small">From</label><input type="date" name="from" value="<?= e($from) ?>" class="form-control"></div>
    <div class="col-6 col-md-2"><label class="form-label small">To</label><input type="date" name="to" value="<?= e($to) ?>" class="form-control"></div>
    <div class="col-md-3"><label class="form-label small">Action</label><select name="action" class="form-select"><option value="">All actions</option>
      <?php foreach ($actions as $a): ?><option <?= $a === $action ? 'selected' : '' ?>><?= e($a) ?></option><?php endforeach; ?></select></div>
    <div class="col-md-3"><label class="form-label small">User</label><input name="user" value="<?= e($userQ) ?>" class="form-control" placeholder="username or name"></div>
    <div class="col-md-auto"><button class="btn btn-primary"><i class="bi bi-funnel"></i> Filter</button>
      <a class="btn btn-outline-success" href="?<?= e(http_build_query(array_merge($_GET, ['export' => 'csv']))) ?>"><i class="bi bi-filetype-csv"></i></a></div>
  </div>
</form>
<div class="card">
  <div class="card-header"><i class="bi bi-shield-check me-1"></i> <?= $total ?> entries (append-only)</div>
  <div class="table-responsive"><table class="table table-sm table-hover mb-0">
    <thead><tr><th>Time</th><th>User</th><th>Action</th><th>Entity</th><th>Details</th><th>IP address</th></tr></thead>
    <tbody>
    <?php foreach ($rows as $r): ?>
      <tr><td class="text-nowrap small"><?= e($r['created_at']) ?></td><td><?= e($r['username'] ?? 'system') ?></td>
        <td><span class="badge text-bg-<?= preg_match('/fail|denied|rejected|locked|csrf|error/', $r['action']) ? 'danger' : 'light text-dark' ?>"><?= e($r['action']) ?></span></td>
        <td class="small"><?= e(($r['entity_type'] ?? '') . ($r['entity_id'] ? ' #' . $r['entity_id'] : '')) ?></td>
        <td class="small"><?= e($r['details'] ?? '') ?></td><td class="small"><?= e($r['ip_address'] ?? '') ?></td></tr>
    <?php endforeach; ?>
    <?php if (!$rows): ?><tr><td colspan="6" class="text-center text-muted py-4">No entries.</td></tr><?php endif; ?>
    </tbody></table></div>
  <?php if ($pages > 1): ?><div class="card-footer"><nav><ul class="pagination pagination-sm mb-0">
    <?php for ($i = max(1, $page - 3); $i <= min($pages, $page + 3); $i++): ?><li class="page-item <?= $i === $page ? 'active' : '' ?>"><a class="page-link" href="?<?= e(http_build_query(array_merge($_GET, ['page' => $i]))) ?>"><?= $i ?></a></li><?php endfor; ?>
  </ul></nav></div><?php endif; ?>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
