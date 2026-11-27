<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'save') {
        $data = ['code' => strtoupper(input('code')), 'name' => input('name'), 'course_id' => input('course_id'), 'intake_year' => input('intake_year')];
        $errors = validate($data, ['code' => 'required|max:30|regex:/^[A-Z0-9\-\/]+$/', 'name' => 'required|max:120', 'course_id' => 'required|int',
                                   'intake_year' => 'required|int']);
        if (!isset($errors['intake_year']) && ((int)$data['intake_year'] < 1990 || (int)$data['intake_year'] > 2100)) {
            $errors['intake_year'] = 'Intake year must be between 1990 and 2100.';
        }
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            try {
                if ($id) {
                    db_query('UPDATE classes SET course_id = ?, code = ?, name = ?, intake_year = ? WHERE id = ?', [$data['course_id'], $data['code'], $data['name'], $data['intake_year'], $id]);
                    audit('class_updated', 'class', $id, $data['code']);
                } else {
                    $id = db_insert('INSERT INTO classes (course_id, code, name, intake_year) VALUES (?, ?, ?, ?)', [$data['course_id'], $data['code'], $data['name'], $data['intake_year']]);
                    audit('class_created', 'class', $id, $data['code']);
                }
                flash('success', 'Class saved.');
            } catch (PDOException $e) {
                if (is_duplicate_error($e)) flash('danger', 'A class with that code already exists.');
                elseif (is_fk_error($e)) flash('danger', 'Select a valid course.');
                else throw $e;
            }
        }
    } elseif ($action === 'delete' && $id) {
        try {
            db_query('DELETE FROM classes WHERE id = ?', [$id]);
            audit('class_deleted', 'class', $id);
            flash('success', 'Class deleted.');
        } catch (PDOException $e) {
            if (!is_fk_error($e)) throw $e;
            flash('danger', 'This class cannot be deleted because it still has students or unit allocations.');
        }
    }
    redirect('admin/classes.php');
}

$courses = db_all('SELECT id, code, name FROM courses ORDER BY code');
$rows = db_all('SELECT k.*, c.code AS course_code, c.name AS course, (SELECT COUNT(*) FROM students s WHERE s.class_id = k.id) AS students
                FROM classes k JOIN courses c ON c.id = k.course_id ORDER BY k.code');
$pageTitle = 'Classes';
$active = 'classes';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="card">
  <div class="card-header d-flex flex-wrap gap-2 align-items-center">
    <span><i class="bi bi-people me-1"></i> Classes / cohorts (<?= count($rows) ?>)</span>
    <input class="form-control form-control-sm table-search ms-auto" placeholder="Search…" data-table-search="#tbl">
    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-edit='<?= e(json_encode(['id' => '', 'intake_year' => date('Y')])) ?>' data-title="Add class" <?= $courses ? '' : 'disabled' ?>><i class="bi bi-plus-lg"></i> Add class</button>
  </div>
  <div class="table-responsive">
    <table class="table table-hover mb-0" id="tbl">
      <thead><tr><th>Code</th><th>Name</th><th>Course</th><th>Intake</th><th>Students</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($rows as $r): ?>
        <tr>
          <td class="fw-semibold"><?= e($r['code']) ?></td><td><?= e($r['name']) ?></td><td><?= e($r['course_code'] . ' – ' . $r['course']) ?></td>
          <td><?= (int)$r['intake_year'] ?></td><td><?= (int)$r['students'] ?></td>
          <td class="text-end text-nowrap">
            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editModal" data-title="Edit class"
                    data-edit='<?= e(json_encode(['id' => $r['id'], 'code' => $r['code'], 'name' => $r['name'], 'course_id' => $r['course_id'], 'intake_year' => $r['intake_year']])) ?>'><i class="bi bi-pencil"></i></button>
            <form method="post" class="d-inline" data-confirm="Delete this class?">
              <?= csrf_field() ?><input type="hidden" name="action" value="delete"><input type="hidden" name="id" value="<?= (int)$r['id'] ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
      <?php if (!$rows): ?><tr><td colspan="6" class="text-center text-muted py-4">No classes yet.</td></tr><?php endif; ?>
      </tbody>
    </table>
  </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1"><div class="modal-dialog"><form method="post" class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Class</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body">
    <?= csrf_field() ?><input type="hidden" name="action" value="save"><input type="hidden" name="id">
    <div class="mb-3"><label class="form-label">Course</label>
      <select name="course_id" class="form-select" required><?php foreach ($courses as $c): ?><option value="<?= (int)$c['id'] ?>"><?= e($c['code'] . ' – ' . $c['name']) ?></option><?php endforeach; ?></select></div>
    <div class="row g-3">
      <div class="col-7"><label class="form-label">Class code</label><input name="code" class="form-control text-uppercase" required maxlength="30" placeholder="e.g. DIT-2026-JAN"></div>
      <div class="col-5"><label class="form-label">Intake year</label><input name="intake_year" type="number" min="1990" max="2100" class="form-control" required></div>
    </div>
    <div class="mt-3"><label class="form-label">Class name</label><input name="name" class="form-control" required maxlength="120"></div>
  </div>
  <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button class="btn btn-primary">Save</button></div>
</form></div></div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
