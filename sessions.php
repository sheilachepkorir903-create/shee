<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer');

$lid = Auth::lecturerId();
$myAssign = array_column(db_all('SELECT id FROM unit_assignments WHERE lecturer_id = ?', [$lid]), 'id');

/** Load a session and make sure it belongs to this lecturer. */
function own_session(int $id, int $lid): ?array
{
    $s = AttendanceService::session($id);
    if (!$s || (int)$s['lecturer_id'] !== $lid) {
        audit('access_denied', 'class_session', $id, 'Not the owner');
        return null;
    }
    return $s;
}

if (is_post()) {
    verify_csrf();
    $action = input('action');
    $id = input_int('id');
    if ($action === 'create') {
        $d = ['assignment_id' => input('assignment_id'), 'session_date' => input('session_date'), 'start_time' => input('start_time'),
              'end_time' => input('end_time'), 'venue' => input('venue'), 'topic' => input('topic')];
        $errors = validate($d, ['assignment_id' => 'required|int', 'session_date' => 'required|date', 'start_time' => 'required|time',
                                'end_time' => 'required|time', 'venue' => 'max:60', 'topic' => 'max:200']);
        if (!in_array((int)$d['assignment_id'], $myAssign)) $errors[] = 'You can only create sessions for your own units.';
        if (!$errors && strtotime($d['end_time']) <= strtotime($d['start_time'])) $errors[] = 'End time must be after start time.';
        if (!$errors && $d['session_date'] < date('Y-m-d')) $errors[] = 'A session cannot be created for a past date.';
        if ($errors) {
            flash('danger', implode(' ', $errors));
        } else {
            $sid = db_insert('INSERT INTO class_sessions (assignment_id, session_date, start_time, end_time, venue, topic, created_by) VALUES (?, ?, ?, ?, ?, ?, ?)',
                [$d['assignment_id'], $d['session_date'], $d['start_time'], $d['end_time'], $d['venue'] ?: null, $d['topic'] ?: null, Auth::id()]);
            audit('session_created', 'class_session', $sid);
            if (input('open_now') === '1' && $d['session_date'] === date('Y-m-d')) {
                $r = AttendanceService::openSession($sid);
                flash($r['ok'] ? 'success' : 'danger', $r['message']);
                if ($r['ok']) redirect('lecturer/station.php?session=' . $sid);
            } else {
                flash('success', 'Session created.');
            }
        }
    } elseif ($id && ($s = own_session($id, $lid))) {
        if ($action === 'open') {
            $r = AttendanceService::openSession($id);
            flash($r['ok'] ? 'success' : 'danger', $r['message']);
            if ($r['ok']) redirect('lecturer/station.php?session=' . $id);
        } elseif ($action === 'close') {
            $r = AttendanceService::closeSession($id);
            flash($r['ok'] ? 'success' : 'danger', $r['message']);
        } elseif ($action === 'cancel' && $s['status'] === 'scheduled') {
            db_query("UPDATE class_sessions SET status = 'cancelled' WHERE id = ?", [$id]);
            audit('session_cancelled', 'class_session', $id);
            flash('success', 'Session cancelled.');
        }
    } else {
        flash('danger', 'Session not found.');
    }
    redirect('lecturer/sessions.php');
}

$assignments = db_all('SELECT ua.id, un.code, un.name, k.code AS class_code FROM unit_assignments ua JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id
                       WHERE ua.lecturer_id = ? ORDER BY un.code', [$lid]);
$sessions = db_all("SELECT cs.*, un.code, un.name, k.code AS class_code,
                           (SELECT COUNT(*) FROM attendance_records ar WHERE ar.session_id = cs.id AND ar.status IN ('present','late')) AS present,
                           (SELECT COUNT(*) FROM enrollments e WHERE e.assignment_id = cs.assignment_id) AS enrolled
                    FROM class_sessions cs JOIN unit_assignments ua ON ua.id = cs.assignment_id JOIN units un ON un.id = ua.unit_id JOIN classes k ON k.id = ua.class_id
                    WHERE ua.lecturer_id = ? AND (cs.status IN ('scheduled','open') OR cs.session_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY))
                    ORDER BY FIELD(cs.status, 'open', 'scheduled', 'closed', 'cancelled'), cs.session_date, cs.start_time", [$lid]);
$pageTitle = 'Attendance Sessions';
$active = 'sessions';
require BSAMS_ROOT . '/app/layout/header.php';
?>
<div class="row g-3">
  <div class="col-lg-4"><div class="card"><div class="card-header"><i class="bi bi-calendar-plus me-1"></i> Create a session</div><div class="card-body">
    <?php if (!$assignments): ?><p class="text-muted mb-0">No units are allocated to you yet. Contact the administrator.</p><?php else: ?>
    <form method="post"><?= csrf_field() ?><input type="hidden" name="action" value="create">
      <div class="mb-2"><label class="form-label">Unit / class</label><select name="assignment_id" class="form-select" required>
        <?php foreach ($assignments as $a): ?><option value="<?= (int)$a['id'] ?>"><?= e($a['code'] . ' ' . $a['name'] . ' – ' . $a['class_code']) ?></option><?php endforeach; ?></select></div>
      <div class="mb-2"><label class="form-label">Date</label><input type="date" name="session_date" value="<?= date('Y-m-d') ?>" min="<?= date('Y-m-d') ?>" class="form-control" required></div>
      <div class="row g-2 mb-2">
        <div class="col"><label class="form-label">Start</label><input type="time" name="start_time" value="<?= date('H:00') ?>" class="form-control" required></div>
        <div class="col"><label class="form-label">End</label><input type="time" name="end_time" value="<?= date('H:00', strtotime('+2 hour')) ?>" class="form-control" required></div>
      </div>
      <div class="mb-2"><label class="form-label">Venue</label><input name="venue" class="form-control" maxlength="60" placeholder="e.g. Lab 2"></div>
      <div class="mb-2"><label class="form-label">Topic</label><input name="topic" class="form-control" maxlength="200"></div>
      <div class="form-check mb-3"><input class="form-check-input" type="checkbox" name="open_now" value="1" id="on" checked><label for="on" class="form-check-label">Open immediately (today only)</label></div>
      <button class="btn btn-primary w-100">Create session</button>
    </form><?php endif; ?>
  </div></div></div>
  <div class="col-lg-8"><div class="card"><div class="card-header"><i class="bi bi-calendar-week me-1"></i> Upcoming, open and recent sessions</div>
    <div class="table-responsive"><table class="table table-hover mb-0">
      <thead><tr><th>Date</th><th>Time</th><th>Unit</th><th>Status</th><th>Present</th><th class="text-end">Actions</th></tr></thead>
      <tbody>
      <?php foreach ($sessions as $s): ?>
        <tr><td><?= e(fmt_date($s['session_date'])) ?></td><td><?= fmt_time($s['start_time']) ?>–<?= fmt_time($s['end_time']) ?></td>
          <td><span class="fw-semibold"><?= e($s['code']) ?></span> <?= e($s['class_code']) ?><div class="small text-muted"><?= e($s['topic'] ?? '') ?> <?= $s['venue'] ? '· ' . e($s['venue']) : '' ?></div></td>
          <td><?= status_badge($s['status']) ?></td><td><?= (int)$s['present'] ?>/<?= (int)$s['enrolled'] ?></td>
          <td class="text-end text-nowrap">
            <?php if ($s['status'] === 'scheduled'): ?>
              <?php if ($s['session_date'] === date('Y-m-d')): ?>
                <form method="post" class="d-inline"><?= csrf_field() ?><input type="hidden" name="action" value="open"><input type="hidden" name="id" value="<?= (int)$s['id'] ?>"><button class="btn btn-sm btn-success"><i class="bi bi-play-fill"></i> Open</button></form>
              <?php endif; ?>
              <form method="post" class="d-inline" data-confirm="Cancel this session?"><?= csrf_field() ?><input type="hidden" name="action" value="cancel"><input type="hidden" name="id" value="<?= (int)$s['id'] ?>"><button class="btn btn-sm btn-outline-danger">Cancel</button></form>
            <?php elseif ($s['status'] === 'open'): ?>
              <a class="btn btn-sm btn-primary" href="<?= url('lecturer/station.php?session=' . (int)$s['id']) ?>"><i class="bi bi-fingerprint"></i> Station</a>
              <form method="post" class="d-inline" data-confirm="Close the session? Students not yet scanned will be marked absent."><?= csrf_field() ?><input type="hidden" name="action" value="close"><input type="hidden" name="id" value="<?= (int)$s['id'] ?>"><button class="btn btn-sm btn-dark">Close</button></form>
            <?php elseif ($s['status'] === 'closed'): ?>
              <a class="btn btn-sm btn-outline-primary" href="<?= url('lecturer/history.php?session=' . (int)$s['id']) ?>">Register</a>
            <?php endif; ?>
          </td></tr>
      <?php endforeach; ?>
      <?php if (!$sessions): ?><tr><td colspan="6" class="text-center text-muted py-4">No sessions yet.</td></tr><?php endif; ?>
      </tbody></table></div></div></div>
</div>
<?php require BSAMS_ROOT . '/app/layout/footer.php'; ?>
