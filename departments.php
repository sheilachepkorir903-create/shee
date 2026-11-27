<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $data = ['code' => strtoupper(input('code')), 'name' => input('name')];
        $errors = validate($data, ['code' => 'required|max:10|regex:/^[A-Z0-9]+$/', 'name' => 'required|max:120']);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    db_query('UPDATE departments SET code = ?, name = ? WHERE id = ?', [$data['code'], $data['name'], $id]);
                    audit('department_updated', 'department', $id, $data['code']);
                } else {
                    $id = db_insert('INSERT INTO departments (code, name) VALUES (?, ?)', [$data['code'], $data['name']]);
                    audit('department_created', 'department', $id, $data['code']);
                }
                flash('success', 'Department saved.');
            } catch (PDOException $e) {
                if (!is_duplicate_error($e)) throw $e;
                flash('danger', 'A department with that code or name already exists.');
            }
        }
    } elseif ($action === 'delete' && $id) {
        try {
            db_query('DELETE FROM departments WHERE id = ?', [$id]);
            audit('department_deleted', 'department', $id);
            flash('success', 'Department deleted.');
        } catch (PDOException $e) {
            if (!is_fk_error($e)) throw $e;
            flash('danger', 'This department cannot be deleted because it still has courses or lecturers.');
        }
    }
    redirect('admin/departments.php');
}

$rows = db_all('SELECT d.*, (SELECT COUNT(*) FROM courses c WHERE c.department_id = d.id) AS courses,
                       (SELECT COUNT(*) FROM lecturers l WHERE l.department_id = d.id) AS lecturers
                FROM departments d ORDER BY d.name');
$pageTitle = 'Departments';
$active = 'departments';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-building me-1"></i> Departments (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-edit='{"id":""}' data-title="Add department"><i class="bi bi-plus-lg"></i> Add department</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Code</th><th>Name</th><th>Courses</th><th>Lecturers</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['code']) ?></td><td><?= e($r['name']) ?></td>
          <td><?= (int)$r['courses'] ?></td><td><?= (int)$r['lecturers'] ?></td>
          <td class="text-end text-nowrap">
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit department"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'code' => $r['code'], 'name' => $r['name']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this department?">
              <?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="5" class="text-center text-muted py-4">No departments yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Department</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="mb-3"><label class="form-label">Code</label><input name="code" class="form-control text-uppercase" required maxlength="10" pattern="[A-Za-z0-9]+" placeholder="e.g. ICT"></div>
    <div class="mb-3"><label class="form-label">Name</label><input name="name" class="form-control" required maxlength="120"></div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
