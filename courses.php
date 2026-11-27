<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

$levels = ['Artisan', 'Certificate', 'Diploma', 'Higher Diploma', 'Degree'];
if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $data = ['code' => strtoupper(input('code')), 'name' => input('name'), 'level' => input('level'), 'department_id' => input('department_id')];
        $errors = validate($data, ['code' => 'required|max:15|regex:/^[A-Z0-9\-]+$/', 'name' => 'required|max:150',
                                   'level' => 'required|in:' . implode(',', $levels), 'department_id' => 'required|int']);
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    db_query('UPDATE courses SET department_id = ?, code = ?, name = ?, level = ? WHERE id = ?', [$data['department_id'], $data['code'], $data['name'], $data['level'], $id]);
                    audit('course_updated', 'course', $id, $data['code']);
                } else {
                    $id = db_insert('INSERT INTO courses (department_id, code, name, level) VALUES (?, ?, ?, ?)', [$data['department_id'], $data['code'], $data['name'], $data['level']]);
                    audit('course_created', 'course', $id, $data['code']);
                }
                flash('success', 'Course saved.');
            } catch (PDOException $e) {
                if (is_duplicate_error($e)) flash('danger', 'A course with that code already exists.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid department.');
                else throw $e;
            }
        }
    } elseif ($action === 'delete' && $id) {
        try {
            db_query('DELETE FROM courses WHERE id = ?', [$id]);
            audit('course_deleted', 'course', $id);
            flash('success', 'Course deleted.');
        } catch (PDOException $e) {
            if (!is_fk_error($e)) throw $e;
            flash('danger', 'This course cannot be deleted because it still has classes or units.');
        }
    }
    redirect('admin/courses.php');
}

$departments = db_all('SELECT id, code, name FROM departments ORDER BY name');
$rows = db_all('SELECT c.*, d.name AS department, (SELECT COUNT(*) FROM units u WHERE u.course_id = c.id) AS units,
                       (SELECT COUNT(*) FROM classes k WHERE k.course_id = c.id) AS classes
                FROM courses c JOIN departments d ON d.id = c.department_id ORDER BY c.code');
$pageTitle = 'Courses';
$active = 'courses';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-journal-bookmark me-1"></i> Courses (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-edit='{"id":"","level":"Diploma"}' data-title="Add course" <?= $departments ? '' : 'disabled title="Add a department first"' ?>><i class="bi bi-plus-lg"></i> Add course</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Code</th><th>Course name</th><th>Level</th><th>Department</th><th>Classes</th><th>Units</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['code']) ?></td><td><?= e($r['name']) ?></td><td><?= e($r['level']) ?></td>
          <td><?= e($r['department']) ?></td><td><?= (int)$r['classes'] ?></td><td><?= (int)$r['units'] ?></td>
          <td class="text-end text-nowrap">
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit course"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'code' => $r['code'], 'name' => $r['name'], 'level' => $r['level'], 'department_id' => $r['department_id']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this course?">
              <?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="7" class="text-center text-muted py-4">No courses yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Course</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="mb-3"><label class="form-label">Department</label>
      <select name="department_id" class="form-select" required><?php foreach ($departments as $d): ?><option value="<?= (int)$d['id'] ?>"><?= e($d['name']) ?></option><?php endforeach; ?></select></div>
    <div class="row g-3">
      <div class="col-5"><label class="form-label">Code</label><input name="code" class="form-control text-uppercase" required maxlength="15" placeholder="e.g. DIT"></div>
      <div class="col-7"><label class="form-label">Level</label>
        <select name="level" class="form-select"><?php foreach ($levels as $l): ?><option><?= e($l) ?></option><?php endforeach; ?></select></div>
    </div>
    <div class="mt-3"><label class="form-label">Course name</label><input name="name" class="form-control" required maxlength="150"></div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
