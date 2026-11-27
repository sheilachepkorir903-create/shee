<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $data = ['code' => strtoupper(input('code')), 'name' => input('name'), 'course_id' => input('course_id')];
        $errors = validate($data, ['code' => 'required|max:20|regex:/^[A-Z0-9\-\/ ]+$/', 'name' => 'required|max:150', 'course_id' => 'required|int']);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    db_query('UPDATE units SET course_id = ?, code = ?, name = ? WHERE id = ?', [$data['course_id'], $data['code'], $data['name'], $id]);
                    audit('unit_updated', 'unit', $id, $data['code']);
                } else {
                    $id = db_insert('INSERT INTO units (course_id, code, name) VALUES (?, ?, ?)', [$data['course_id'], $data['code'], $data['name']]);
                    audit('unit_created', 'unit', $id, $data['code']);
                }
                flash('success', 'Unit saved.');
            } catch (PDOException $e) {
                if (is_duplicate_error($e)) flash('danger', 'A unit with that code already exists.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid course.');
                else throw $e;
            }
        }
    } elseif ($action === 'delete' && $id) {
        try {
            db_query('DELETE FROM units WHERE id = ?', [$id]);
            audit('unit_deleted', 'unit', $id);
            flash('success', 'Unit deleted.');
        } catch (PDOException $e) {
            if (!is_fk_error($e)) throw $e;
            flash('danger', 'This unit cannot be deleted because it has been allocated to a class.');
        }
    }
    redirect('admin/units.php');
}

$courses = db_all('SELECT id, code, name FROM courses ORDER BY code');
$rows = db_all('SELECT u.*, c.code AS course_code, (SELECT COUNT(*) FROM unit_assignments a WHERE a.unit_id = u.id) AS allocations
                FROM units u JOIN courses c ON c.id = u.course_id ORDER BY u.code');
$pageTitle = 'Units';
$active = 'units';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-book me-1"></i> Units (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-edit='{"id":""}' data-title="Add unit" <?= $courses ? '' : 'disabled' ?>><i class="bi bi-plus-lg"></i> Add unit</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Code</th><th>Unit name</th><th>Course</th><th>Allocations</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['code']) ?></td><td><?= e($r['name']) ?></td><td><?= e($r['course_code']) ?></td><td><?= (int)$r['allocations'] ?></td>
          <td class="text-end text-nowrap">
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit unit"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'code' => $r['code'], 'name' => $r['name'], 'course_id' => $r['course_id']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this unit?">
              <?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="5" class="text-center text-muted py-4">No units yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Unit</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="mb-3"><label class="form-label">Course</label>
      <select name="course_id" class="form-select" required><?php foreach ($courses as $c): ?><option value="<?= (int)$c['id'] ?>"><?= e($c['code'] . ' – ' . $c['name']) ?></option><?php endforeach; ?></select></div>
    <div class="mb-3"><label class="form-label">Unit code</label><input name="code" class="form-control text-uppercase" required maxlength="20" placeholder="e.g. DIT101"></div>
    <div class="mb-3"><label class="form-label">Unit name</label><input name="name" class="form-control" required maxlength="150"></div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
