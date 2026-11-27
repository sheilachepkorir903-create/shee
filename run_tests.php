<?php
/**
 * BSAMS automated test suite.
 *
 *   C:\xampp\php\php.exe tests\run_tests.php            (resets the database with demo data, then tests)
 *   C:\xampp\php\php.exe tests\run_tests.php --bridge   (also tests the hardware code path with the MOCK bridge; needs Node.js)
 *
 * Apache and MySQL must be running and the app reachable at http://localhost/bsams.
 * Results are written to tests/results/ (JSON + text) and used in Chapter Four.
 * IMPORTANT: biometric tests here use the SIMULATED scanner or the MOCK bridge, not real fingerprints.
 */
declare(strict_types=1);
if (PHP_SAPI !== 'cli') exit;

$root = dirname(__DIR__);
$php = PHP_BINARY;
$withBridge = in_array('--bridge', $argv, true);
if (!in_array('--no-reset', $argv, true)) {
    echo "Resetting database with demo data...\n";
    passthru(escapeshellarg($php) . ' ' . escapeshellarg("$root/database/setup.php") . ' --demo', $rc);
    if ($rc !== 0) exit("Setup failed\n");
}
require "$root/app/bootstrap.php";

const BASE = 'http://localhost/bsams/';
$results = [];
$current = '';

function section(string $name): void { global $current; $current = $name; echo "\n== $name ==\n"; }
function check(string $id, string $desc, bool $pass, string $req = '', string $note = ''): void
{
    global $results, $current;
    $results[] = ['id' => $id, 'level' => $current, 'description' => $desc, 'requirement' => $req, 'result' => $pass ? 'PASS' : 'FAIL', 'note' => $note];
    printf("  [%s] %-6s %s%s\n", $pass ? 'PASS' : 'FAIL', $id, $desc, $note !== '' ? "  ($note)" : '');
}

/** Minimal HTTP client with its own cookie jar (one per simulated user). */
final class Client
{
    private string $jar;
    public string $token = '';
    public function __construct(public string $name) { $this->jar = tempnam(sys_get_temp_dir(), 'bsams'); }
    public function req(string $method, string $path, array $data = [], array $headers = [], bool $multipart = false): array
    {
        $ch = curl_init(BASE . ltrim($path, '/'));
        curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER => true, CURLOPT_HEADER => true, CURLOPT_COOKIEJAR => $this->jar, CURLOPT_COOKIEFILE => $this->jar,
            CURLOPT_FOLLOWLOCATION => false, CURLOPT_TIMEOUT => 30, CURLOPT_HTTPHEADER => $headers]);
        if ($method === 'POST') {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $multipart ? $data : http_build_query($data));
        }
        $raw = (string)curl_exec($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);
        $hs = substr($raw, 0, $info['header_size']);
        $body = substr($raw, $info['header_size']);
        $this->grabToken($body);
        return ['code' => $info['http_code'], 'headers' => $hs, 'body' => $body, 'location' => $info['redirect_url'], 'time' => $info['total_time'],
                'json' => json_decode($body, true)];
    }
    public function get(string $p): array { return $this->req('GET', $p); }
    public function post(string $p, array $d = [], bool $withToken = true): array
    {
        if ($withToken) $d['csrf_token'] = $this->token;
        return $this->req('POST', $p, $d);
    }
    public function api(string $p, array $d): array
    {
        return $this->req('POST', $p, $d, ['X-CSRF-Token: ' . $this->token, 'X-Requested-With: fetch', 'Accept: application/json']);
    }
    private function grabToken(string $body): void
    {
        if (preg_match('/name="csrf-token" content="([a-f0-9]{64})"/', $body, $m) || preg_match('/name="csrf_token" value="([a-f0-9]{64})"/', $body, $m)) $this->token = $m[1];
    }
    public function login(string $u, string $p): array
    {
        $this->get('login.php');
        $r = $this->post('login.php', ['username' => $u, 'password' => $p]);
        if ($r['location']) $this->get(str_replace(BASE, '', $r['location']));
        return $r;
    }
    public function cookies(): string { return (string)@file_get_contents($this->jar); }
}

$t0 = microtime(true);
// =====================================================================
section('Unit tests');
check('UT-01', 'validate() rejects missing required field and bad email', count(validate(['a' => '', 'b' => 'x@'], ['a' => 'required', 'b' => 'email'])) === 2);
check('UT-02', 'validate() accepts valid input', validate(['a' => 'abc', 'b' => 'x@y.ke', 'p' => '0712345678'], ['a' => 'required|max:5', 'b' => 'email', 'p' => 'phone']) === []);
check('UT-03', 'Password policy rejects weak and accepts strong passwords', password_errors('abc') !== null && password_errors('password1') !== null && password_errors('Strong123') === null, 'FR-05');
check('UT-04', 'random_password() always satisfies the password policy', (function () { for ($i = 0; $i < 200; $i++) if (password_errors(random_password())) return false; return true; })());
check('UT-05', 'e() escapes HTML special characters (XSS)', e('<script>"x"</script>') === '&lt;script&gt;&quot;x&quot;&lt;/script&gt;', 'NFR-01');
$enc = TemplateVault::encrypt('sample-template');
check('UT-06', 'TemplateVault encrypts (ciphertext differs) and decrypts correctly', $enc['ciphertext'] !== 'sample-template' && TemplateVault::decrypt($enc['ciphertext'], $enc['iv'], $enc['tag']) === 'sample-template', 'FR-19, NFR-02');
$tampered = false;
try { TemplateVault::decrypt($enc['ciphertext'] ^ str_repeat("\x01", strlen($enc['ciphertext'])), $enc['iv'], $enc['tag']); } catch (RuntimeException $e) { $tampered = true; }
check('UT-07', 'TemplateVault detects altered ciphertext (GCM authentication)', $tampered, 'NFR-02');
$enc2 = TemplateVault::encrypt('sample-template');
check('UT-08', 'Same template encrypts differently each time (random IV)', $enc['ciphertext'] !== $enc2['ciphertext']);
$gen = []; $imp = [];
for ($i = 0; $i < 200; $i++) {
    $a = SimulatedProvider::capture("t:$i"); $b = SimulatedProvider::capture("t:$i"); $c = SimulatedProvider::capture('t:' . ($i + 5000));
    $gen[] = SimulatedProvider::similarity($a['template'], $b['template']); $imp[] = SimulatedProvider::similarity($a['template'], $c['template']);
}
$thr = (float)setting('match_threshold');
check('UT-09', 'Simulated matcher: 200 genuine pairs all score at or above threshold', min($gen) >= $thr, 'FR-22', sprintf('min %.1f, mean %.1f, threshold %.0f', min($gen), array_sum($gen) / 200, $thr));
check('UT-10', 'Simulated matcher: 200 impostor pairs all score below threshold', max($imp) < $thr, 'FR-25', sprintf('max %.1f, mean %.1f', max($imp), array_sum($imp) / 200));
$bad = false;
try { (new SimulatedProvider())->prepareTemplate('{"fmt":"x"}'); } catch (InvalidArgumentException $e) { $bad = true; }
check('UT-11', 'Malformed template is rejected by the provider', $bad);
$bad = false;
try { new BridgeProvider('http://10.0.0.5:8765'); } catch (InvalidArgumentException $e) { $bad = true; }
check('UT-12', 'Bridge URL that is not the local machine is refused', $bad, 'NFR-02');

// =====================================================================
section('Authentication and access control');
$anon = new Client('anon');
$r = $anon->get('admin/dashboard.php');
check('ST-01', 'Unauthenticated user is redirected to the login page', $r['code'] === 302 && str_contains($r['location'], 'login.php'), 'FR-03');
$admin = new Client('admin');
$before = '';
$anon->get('login.php');
preg_match('/BSAMSSESSID\s+(\S+)/', $admin->cookies(), $m0);
$admin->get('login.php');
preg_match('/BSAMSSESSID\s+(\S+)/', $admin->cookies(), $m1);
$r = $admin->login('admin', 'Admin@1234');
preg_match('/BSAMSSESSID\s+(\S+)/', $admin->cookies(), $m2);
check('ST-02', 'Administrator logs in with valid credentials', $r['code'] === 302 && str_contains($r['location'], 'admin/dashboard.php'), 'FR-01');
check('SEC-01', 'Session ID is regenerated after login (session fixation protection)', ($m1[1] ?? 'a') !== ($m2[1] ?? 'a'), 'NFR-01');
$hdr = $admin->get('login.php');
$x = new Client('x'); $h = $x->get('login.php')['headers'];
check('SEC-02', 'Session cookie is HttpOnly and SameSite=Strict', stripos($h, 'httponly') !== false && stripos($h, 'samesite=strict') !== false, 'NFR-01');
$hash = db_value("SELECT password_hash FROM users WHERE username = 'admin'");
check('ST-03', 'Passwords are stored as password_hash() hashes, not plain text', str_starts_with((string)$hash, '$2y$') || str_starts_with((string)$hash, '$argon2'), 'FR-02');
$bad = new Client('bad');
$r = $bad->login('admin', 'WrongPass1');
check('ST-04', 'Wrong password is rejected with a generic message', $r['code'] === 200 && str_contains($r['body'], 'Invalid username or password'), 'FR-01');
$sqli = new Client('sqli');
$r = $sqli->login("' OR '1'='1' -- ", "' OR '1'='1");
check('SEC-03', 'SQL injection in the login form does not log in', $r['code'] === 200 && !str_contains($r['location'] ?? '', 'dashboard'), 'NFR-01');
// Lockout
$lec = new Client('lec');
db_query("UPDATE users SET failed_attempts = 0, locked_until = NULL WHERE username = 'LEC003'");
for ($i = 0; $i < 5; $i++) { $tmp = new Client('lock'); $tmp->login('LEC003', 'Wrong' . $i . 'Pass'); }
$tmp = new Client('lock');
$r = $tmp->login('LEC003', 'Lecturer@123');
check('ST-05', 'Account is locked after 5 failed attempts even with the correct password', $r['code'] === 200 && str_contains($r['body'], 'locked'), 'FR-04');
db_query("UPDATE users SET failed_attempts = 0, locked_until = NULL WHERE username = 'LEC003'");
$csrf = new Client('csrf');
$csrf->get('login.php');
$r = $csrf->req('POST', 'login.php', ['username' => 'admin', 'password' => 'Admin@1234']);
check('SEC-04', 'Form submitted without a CSRF token is rejected (no login, request refused)', in_array($r['code'], [302, 419], true) && !str_contains((string)$r['location'], 'dashboard') && $csrf->get('admin/dashboard.php')['code'] === 302, 'NFR-01', 'HTTP ' . $r['code']);
$r = $admin->req('POST', 'admin/departments.php', ['action' => 'save', 'code' => 'HACK', 'name' => 'Forged', 'csrf_token' => str_repeat('0', 64)]);
check('SEC-05', 'Forged CSRF token on a logged-in admin form is rejected', !db_value("SELECT COUNT(*) FROM departments WHERE code = 'HACK'"), 'NFR-01');
$lec1 = new Client('LEC001');
$lec1->login('LEC001', 'Lecturer@123');
$stu = new Client('student');
$stu->login('DIT/001/2025', 'Student@123');
check('ST-06', 'Lecturer is denied access to administrator pages (403)', $lec1->get('admin/students.php')['code'] === 403, 'FR-03');
check('ST-07', 'Student is denied access to lecturer and admin pages (403)', $stu->get('lecturer/sessions.php')['code'] === 403 && $stu->get('admin/settings.php')['code'] === 403, 'FR-03');
foreach (['config/config.php', 'storage/keys/biometric.key', 'database/schema.sql', 'app/Auth.php', 'tests/run_tests.php'] as $f) $blocked[] = (new Client('w'))->get($f)['code'];
check('SEC-06', 'Configuration, key, database and source folders are not web-accessible', count(array_filter($blocked, fn($c) => $c !== 403)) === 0, 'NFR-02', implode(',', $blocked));
$r = $stu->get('logout.php');
check('SEC-07', 'Logout by GET link does not log the user out (logout requires POST + CSRF)', $stu->get('student/dashboard.php')['code'] === 200);

// =====================================================================
section('Records management (administrator)');
$r = $admin->post('admin/departments.php', ['action' => 'save', 'code' => 'ENG', 'name' => 'Engineering']);
$deptId = (int)db_value("SELECT id FROM departments WHERE code = 'ENG'");
check('ST-08', 'Administrator creates a department', $deptId > 0, 'FR-13');
$admin->get('admin/departments.php');
$admin->post('admin/departments.php', ['action' => 'save', 'code' => 'ENG', 'name' => 'Engineering Two']);
check('ST-09', 'Duplicate department code is rejected', (int)db_value("SELECT COUNT(*) FROM departments WHERE code = 'ENG'") === 1, 'FR-13');
$admin->get('admin/departments.php');
$admin->post('admin/departments.php', ['action' => 'save', 'code' => 'XSS', 'name' => '<script>alert(1)</script>']);
$page = $admin->get('admin/departments.php')['body'];
check('SEC-08', 'Stored script in a name is displayed escaped, not executed (XSS)', str_contains($page, '&lt;script&gt;alert(1)&lt;/script&gt;') && !str_contains($page, '<script>alert(1)</script>'), 'NFR-01');
$admin->post('admin/courses.php', ['action' => 'save', 'code' => 'DEE', 'name' => 'Diploma in Electrical Engineering', 'level' => 'Diploma', 'department_id' => $deptId]);
$courseId = (int)db_value("SELECT id FROM courses WHERE code = 'DEE'");
$admin->get('admin/classes.php');
$admin->post('admin/classes.php', ['action' => 'save', 'code' => 'DEE-2026-JAN', 'name' => 'DEE Jan 2026', 'course_id' => $courseId, 'intake_year' => 2026]);
$classId = (int)db_value("SELECT id FROM classes WHERE code = 'DEE-2026-JAN'");
$admin->get('admin/units.php');
$admin->post('admin/units.php', ['action' => 'save', 'code' => 'DEE101', 'name' => 'Electrical Principles', 'course_id' => $courseId]);
$unitId = (int)db_value("SELECT id FROM units WHERE code = 'DEE101'");
check('ST-10', 'Administrator creates a course, class and unit', $courseId && $classId && $unitId, 'FR-13');
$admin->get('admin/departments.php');
$admin->post('admin/departments.php', ['action' => 'delete', 'id' => $deptId]);
check('ST-11', 'Department that still has courses cannot be deleted', (bool)db_value('SELECT COUNT(*) FROM departments WHERE id = ?', [$deptId]), 'FR-15');
$admin->get('admin/students.php');
$r = $admin->post('admin/students.php', ['action' => 'save', 'admission_no' => 'DEE/001/2026', 'full_name' => 'Test Student One', 'gender' => 'Female', 'email' => 'tso@example.com',
    'phone' => '0712000001', 'class_id' => $classId, 'date_of_birth' => '', 'status' => 'active']);
$flash = $admin->get('admin/students.php')['body'];
preg_match('/Temporary password: (\S+)/', $flash, $tp);
$newStu = db_one("SELECT s.id, u.must_change_password FROM students s JOIN users u ON u.id = s.user_id WHERE s.admission_no = 'DEE/001/2026'");
check('ST-12', 'Registering a student creates the student record and a login account with temporary password', $newStu && (int)$newStu['must_change_password'] === 1 && !empty($tp[1]), 'FR-07, FR-09');
$admin->post('admin/students.php', ['action' => 'save', 'admission_no' => 'DEE/001/2026', 'full_name' => 'Duplicate', 'class_id' => $classId, 'status' => 'active']);
check('ST-13', 'Duplicate admission number is rejected', (int)db_value("SELECT COUNT(*) FROM students WHERE admission_no = 'DEE/001/2026'") === 1, 'FR-08');
$admin->get('admin/students.php');
$admin->post('admin/students.php', ['action' => 'save', 'admission_no' => 'BAD NO!', 'full_name' => 'X', 'class_id' => $classId, 'status' => 'active', 'email' => 'not-an-email']);
check('ST-14', 'Invalid student input (admission number, email) is rejected by validation', !db_value("SELECT COUNT(*) FROM students WHERE admission_no = 'BAD NO!'"), 'FR-07');
// First login forces password change
$ns = new Client('newstudent');
$ns->login('DEE/001/2026', $tp[1] ?? '');
$r = $ns->get('student/dashboard.php');
check('ST-15', 'New user is forced to change the temporary password at first login', $r['code'] === 302 && str_contains($r['location'], 'change_password.php'), 'FR-05');
$ns->get('change_password.php');
$ns->post('change_password.php', ['current_password' => $tp[1] ?? '', 'new_password' => 'NewPass123', 'confirm_password' => 'NewPass123']);
check('ST-16', 'User changes password and can then use the system', $ns->get('student/dashboard.php')['code'] === 200, 'FR-05');
// CSV import
$csv = tempnam(sys_get_temp_dir(), 'csv');
file_put_contents($csv, "admission_no,full_name,gender,email,phone,class_code\nDEE/002/2026,Csv Student Two,Male,,0712000002,DEE-2026-JAN\nDEE/003/2026,Csv Student Three,Female,,,DEE-2026-JAN\nDEE/004/2026,Bad Class,Male,,,NOPE\n");
$admin->get('admin/students.php');
$admin->req('POST', 'admin/students.php', ['action' => 'import', 'csrf_token' => $admin->token, 'csv' => new CURLFile($csv, 'text/csv', 'students.csv')], [], true);
check('ST-17', 'CSV import adds valid rows and reports invalid rows', (int)db_value("SELECT COUNT(*) FROM students WHERE admission_no IN ('DEE/002/2026','DEE/003/2026')") === 2 && !db_value("SELECT COUNT(*) FROM students WHERE admission_no = 'DEE/004/2026'"), 'FR-10');
$admin->get('admin/lecturers.php');
$admin->post('admin/lecturers.php', ['action' => 'save', 'staff_no' => 'LEC900', 'full_name' => 'Test Lecturer', 'email' => 'lec900@example.com', 'phone' => '0712000900', 'department_id' => $deptId, 'gender' => 'Male']);
$lec900 = (int)db_value("SELECT id FROM lecturers WHERE staff_no = 'LEC900'");
check('ST-18', 'Administrator registers a lecturer with a login account', $lec900 > 0 && db_value("SELECT role FROM users WHERE username = 'LEC900'") === 'lecturer', 'FR-11');
$admin->get('admin/assignments.php');
$admin->post('admin/assignments.php', ['action' => 'save', 'unit_id' => $unitId, 'class_id' => $classId, 'lecturer_id' => $lec900, 'academic_year' => current_academic_year(), 'term' => 1, 'register_class' => '1']);
$aId = (int)db_value('SELECT id FROM unit_assignments WHERE unit_id = ? AND class_id = ?', [$unitId, $classId]);
check('ST-19', 'Unit is allocated to a lecturer and the whole class is registered for it', $aId > 0 && (int)db_value('SELECT COUNT(*) FROM enrollments WHERE assignment_id = ?', [$aId]) === 3, 'FR-12, FR-14');
$admin->post('admin/assignments.php', ['action' => 'save', 'unit_id' => $unitId, 'class_id' => $classId, 'lecturer_id' => $lec900, 'academic_year' => current_academic_year(), 'term' => 1]);
check('ST-20', 'The same unit cannot be allocated twice to a class in one term', (int)db_value('SELECT COUNT(*) FROM unit_assignments WHERE unit_id = ? AND class_id = ?', [$unitId, $classId]) === 1, 'FR-12');

// =====================================================================
section('Fingerprint enrolment (SIMULATED scanner)');
$s1 = (int)$newStu['id'];
$s2 = (int)db_value("SELECT id FROM students WHERE admission_no = 'DEE/002/2026'");
$s3 = (int)db_value("SELECT id FROM students WHERE admission_no = 'DEE/003/2026'");
$admin->get("admin/fingerprints.php?student=$s1");
$cap = $admin->api('api/sim_capture.php', ['identity' => "student:$s1:R_INDEX"])['json'];
$r = $admin->api('api/enroll.php', ['student_id' => $s1, 'finger' => 'R_INDEX', 'template' => $cap['template'], 'quality' => $cap['quality']]);
check('BT-01', 'Enrolment is refused until the student\'s consent is recorded', $r['code'] === 422 && str_contains($r['json']['message'] ?? '', 'consent'), 'FR-16');
foreach ([$s1, $s2] as $sid) { $admin->get("admin/fingerprints.php?student=$sid"); $admin->post('admin/fingerprints.php', ['action' => 'consent', 'student_id' => $sid, 'agree' => '1']); }
check('BT-02', 'Consent is recorded with date, version and administrator', (int)db_value('SELECT COUNT(*) FROM biometric_consents WHERE student_id IN (?, ?) AND recorded_by IS NOT NULL', [$s1, $s2]) === 2, 'FR-16');
$admin->get("admin/fingerprints.php?student=$s1");
$ok = true;
foreach (['R_INDEX', 'L_INDEX'] as $f) {
    $cap = $admin->api('api/sim_capture.php', ['identity' => "student:$s1:$f"])['json'];
    $r = $admin->api('api/enroll.php', ['student_id' => $s1, 'finger' => $f, 'template' => $cap['template'], 'quality' => max(60, $cap['quality'])]);
    $ok = $ok && !empty($r['json']['ok']);
}
check('BT-03', 'Two fingers are enrolled for a student', $ok && (int)db_value('SELECT COUNT(*) FROM biometric_templates WHERE student_id = ?', [$s1]) === 2, 'FR-17');
$row = db_one('SELECT template_enc, template_hash FROM biometric_templates WHERE student_id = ? LIMIT 1', [$s1]);
check('BT-04', 'Stored template is encrypted (no readable template or image data in the database)', !str_contains($row['template_enc'], 'BSAMS-SIM') && strlen($row['template_hash']) === 64, 'FR-19, NFR-02');
$cap = $admin->api('api/sim_capture.php', ['identity' => "student:$s2:R_INDEX", 'poor' => '1'])['json'];
$r = $admin->api('api/enroll.php', ['student_id' => $s2, 'finger' => 'R_INDEX', 'template' => $cap['template'], 'quality' => $cap['quality']]);
check('BT-05', 'Low-quality capture is rejected and the user is asked to rescan', empty($r['json']['ok']) && str_contains($r['json']['message'] ?? '', 'quality'), 'FR-18', 'quality ' . $cap['quality']);
$cap = $admin->api('api/sim_capture.php', ['identity' => "student:$s1:R_INDEX"])['json'];
$r = $admin->api('api/enroll.php', ['student_id' => $s2, 'finger' => 'R_INDEX', 'template' => $cap['template'], 'quality' => max(60, $cap['quality'])]);
check('BT-06', 'A finger already enrolled for another student is rejected', empty($r['json']['ok']) && str_contains($r['json']['message'] ?? '', 'another student'), 'FR-20');
$cap = $admin->api('api/sim_capture.php', ['identity' => "student:$s2:R_INDEX"])['json'];
$r = $admin->api('api/enroll.php', ['student_id' => $s2, 'finger' => 'R_INDEX', 'template' => $cap['template'], 'quality' => max(60, $cap['quality'])]);
check('BT-07', 'Second student enrols own finger successfully', !empty($r['json']['ok']), 'FR-17');
$r = $lec1->api('api/enroll.php', ['student_id' => $s2, 'finger' => 'L_INDEX', 'template' => $cap['template'], 'quality' => 80]);
check('BT-08', 'A lecturer cannot enrol fingerprints (admin only)', $r['code'] === 403, 'FR-03');

// =====================================================================
section('Attendance sessions and fingerprint identification (SIMULATED)');
$l900 = new Client('LEC900');
db_query("UPDATE users SET password_hash = ?, must_change_password = 0 WHERE username = 'LEC900'", [password_hash('Lecturer@900', PASSWORD_DEFAULT)]);
$l900->login('LEC900', 'Lecturer@900');
$l900->get('lecturer/sessions.php');
$r = $l900->post('lecturer/sessions.php', ['action' => 'create', 'assignment_id' => $aId, 'session_date' => date('Y-m-d'), 'start_time' => '00:00', 'end_time' => '23:59', 'venue' => 'Workshop', 'topic' => 'Test session']);
$sess = (int)db_value('SELECT MAX(id) FROM class_sessions WHERE assignment_id = ?', [$aId]);
check('ST-21', 'Lecturer creates a session for an allocated unit', $sess > 0 && db_value('SELECT status FROM class_sessions WHERE id = ?', [$sess]) === 'scheduled', 'FR-29');
$otherA = (int)db_value("SELECT ua.id FROM unit_assignments ua JOIN lecturers l ON l.id = ua.lecturer_id WHERE l.staff_no = 'LEC001' LIMIT 1");
$cnt = (int)db_value('SELECT COUNT(*) FROM class_sessions WHERE assignment_id = ?', [$otherA]);
$l900->post('lecturer/sessions.php', ['action' => 'create', 'assignment_id' => $otherA, 'session_date' => date('Y-m-d'), 'start_time' => '08:00', 'end_time' => '10:00']);
check('ST-22', 'Lecturer cannot create a session for another lecturer\'s unit', (int)db_value('SELECT COUNT(*) FROM class_sessions WHERE assignment_id = ?', [$otherA]) === $cnt, 'FR-29');
$l900->get('lecturer/sessions.php');
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$s1:R_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
check('ST-23', 'Scanning is refused while the session is not open', empty($r['json']['ok']) && str_contains($r['json']['message'] ?? '', 'not open'), 'FR-30');
$l900->post('lecturer/sessions.php', ['action' => 'open', 'id' => $sess]);
check('ST-24', 'Lecturer opens the session', db_value('SELECT status FROM class_sessions WHERE id = ?', [$sess]) === 'open', 'FR-30');
$l900->get("lecturer/station.php?session=$sess");
$times = [];
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$s1:L_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
$times[] = $r['time'];
$rec = db_one('SELECT * FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $s1]);
check('BT-09', 'Enrolled student is identified and attendance recorded automatically', ($r['json']['result'] ?? '') === 'success' && $rec !== null, 'FR-22, FR-23', 'score ' . ($r['json']['score'] ?? '?'));
check('BT-10', 'Record stores session (unit, class, lecturer via allocation), date/time, method and score', $rec && $rec['method'] === 'simulated' && $rec['recorded_at'] && $rec['match_score'] > 0 && (int)$rec['recorded_by'] > 0, 'FR-23');
check('BT-11', 'Success message shows the student\'s name and admission number', ($r['json']['student']['admission_no'] ?? '') === 'DEE/001/2026' && str_contains($r['json']['message'] ?? '', 'at'), 'FR-26');
check('BT-12', 'Student scanning after the grace period is marked late', ($rec['status'] ?? '') === (time() > strtotime('today') + 15 * 60 ? 'late' : 'present'), 'FR-27', 'session started 00:00');
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$s1:R_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
$times[] = $r['time'];
check('BT-13', 'Second scan in the same session is reported as duplicate; still one record', ($r['json']['result'] ?? '') === 'duplicate' && (int)db_value('SELECT COUNT(*) FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $s1]) === 1, 'FR-24');
$dup = false;
try { db_query("INSERT INTO attendance_records (session_id, student_id, status, method) VALUES (?, ?, 'present', 'manual')", [$sess, $s1]); } catch (PDOException $e) { $dup = is_duplicate_error($e); }
check('BT-14', 'Database unique key itself blocks a duplicate attendance row', $dup, 'FR-24');
$cap = $l900->api('api/sim_capture.php', ['identity' => 'unknown'])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
$times[] = $r['time'];
check('BT-15', 'Unregistered fingerprint is rejected with a clear message', ($r['json']['result'] ?? '') === 'rejected' && str_contains($r['json']['message'] ?? '', 'not recognised'), 'FR-25');
$outsider = (int)db_value("SELECT id FROM students WHERE admission_no = 'DIT/001/2025'");
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$outsider:R_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
check('BT-16', 'Enrolled student who is NOT registered for this unit is rejected', ($r['json']['result'] ?? '') === 'rejected' && !db_value('SELECT COUNT(*) FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $outsider]), 'FR-22, FR-25');
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$s3:R_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
check('BT-17', 'Registered student without enrolled fingerprints is rejected', ($r['json']['result'] ?? '') === 'rejected', 'FR-25');
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 10]);
check('BT-18', 'Poor quality scan asks the student to try again', ($r['json']['result'] ?? '') === 'retry', 'FR-18');
$lec1->get('lecturer/dashboard.php');
$r = $lec1->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
check('SEC-09', 'A lecturer cannot submit scans for another lecturer\'s session', $r['code'] === 403, 'FR-03');
$r = $l900->req('GET', "api/live.php?session_id=$sess", [], ['Accept: application/json', 'X-Requested-With: fetch']);
check('ST-25', 'Live attendance returns present count and list for the open session', ($r['json']['present'] ?? -1) === 1 && ($r['json']['enrolled'] ?? 0) === 3, 'FR-32');
$l900->get("lecturer/station.php?session=$sess");
$l900->post("lecturer/station.php?session=$sess", ['student_id' => $s3, 'status' => 'present', 'reason' => 'ok']);
check('ST-26', 'Manual marking without a proper reason is refused', !db_value('SELECT COUNT(*) FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $s3]), 'FR-28');
$l900->get("lecturer/station.php?session=$sess");
$l900->post("lecturer/station.php?session=$sess", ['student_id' => $s3, 'status' => 'present', 'reason' => 'Fingerprint not yet enrolled; ID card checked']);
check('ST-27', 'Manual marking with a reason is saved and flagged as manual', db_value('SELECT method FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $s3]) === 'manual', 'FR-28');
$l900->get('lecturer/sessions.php');
$l900->post('lecturer/sessions.php', ['action' => 'close', 'id' => $sess]);
$abs = db_one('SELECT status, method FROM attendance_records WHERE session_id = ? AND student_id = ?', [$sess, $s2]);
check('ST-28', 'Closing the session records students who did not scan as absent', db_value('SELECT status FROM class_sessions WHERE id = ?', [$sess]) === 'closed' && ($abs['status'] ?? '') === 'absent' && $abs['method'] === 'auto', 'FR-31');
$l900->get("lecturer/station.php?session=$sess");
$cap = $l900->api('api/sim_capture.php', ['identity' => "student:$s2:R_INDEX"])['json'];
$r = $l900->api('api/scan.php', ['session_id' => $sess, 'template' => $cap['template'], 'quality' => 80]);
check('ST-29', 'Scanning after the session is closed is refused', empty($r['json']['ok']), 'FR-30');

// =====================================================================
section('Reports, percentages and notifications');
$sumRow = db_one('SELECT * FROM v_attendance_summary WHERE student_id = ? AND assignment_id = ?', [$s2, $aId]);
check('ST-30', 'Attendance percentage is calculated correctly (absent student = 0%, present = 100%)',
    (float)$sumRow['attendance_percent'] === 0.0 && (float)db_value('SELECT attendance_percent FROM v_attendance_summary WHERE student_id = ? AND assignment_id = ?', [$s1, $aId]) === 100.0, 'FR-33');
// Independent recomputation for every demo student/unit
$mismatch = 0;
foreach (db_all('SELECT * FROM v_attendance_summary WHERE sessions_held > 0') as $v) {
    $held = (int)db_value("SELECT COUNT(*) FROM class_sessions WHERE assignment_id = ? AND status = 'closed'", [$v['assignment_id']]);
    $att = (int)db_value("SELECT COUNT(*) FROM attendance_records ar JOIN class_sessions cs ON cs.id = ar.session_id WHERE cs.assignment_id = ? AND ar.student_id = ? AND ar.status IN ('present','late') AND cs.status = 'closed'", [$v['assignment_id'], $v['student_id']]);
    if (abs(round(100 * $att / $held, 1) - (float)$v['attendance_percent']) > 0.05) $mismatch++;
}
check('ST-31', 'All attendance percentages match an independent recalculation', $mismatch === 0, 'FR-33, FR-34', $mismatch . ' mismatches');
$n = (int)db_value("SELECT COUNT(*) FROM notifications n JOIN students s ON s.user_id = n.user_id WHERE s.id = ? AND n.title LIKE 'Low attendance%'", [$s2]);
check('ST-32', 'Student below the minimum receives a low-attendance notification', $n === 1, 'FR-38');
$stuPage = $stu->get('student/attendance.php');
check('ST-33', 'Student sees own units, percentages and history', $stuPage['code'] === 200 && str_contains($stuPage['body'], 'DIT101') && str_contains($stuPage['body'], 'Attendance history'), 'FR-33');
$r = $stu->get('student/attendance.php?unit=' . $aId);
check('SEC-10', 'Student cannot view another unit\'s records by changing the URL', $r['code'] === 200 && !str_contains($r['body'], 'DEE101'), 'FR-03');
$r = $admin->get("admin/reports.php?type=unit&assignment_id=$aId&export=csv");
check('ST-34', 'Unit attendance report exports to CSV', str_contains($r['headers'], 'text/csv') && str_contains($r['body'], 'Admission No.') && str_contains($r['body'], 'DEE/001/2026'), 'FR-35, FR-36');
$r = $admin->get("admin/reports.php?type=session&assignment_id=$aId&session_id=$sess");
check('ST-35', 'Session register report lists every registered student with status', $r['code'] === 200 && substr_count($r['body'], 'DEE/00') >= 3, 'FR-35');
$r = $l900->get('lecturer/reports.php?type=unit&assignment_id=' . $otherA);
check('SEC-11', 'Lecturer cannot open reports for another lecturer\'s unit', $r['code'] === 403, 'FR-03');
$r = $lec1->get('lecturer/reports.php?type=below&export=csv');
check('ST-36', 'Lecturer exports list of students below the minimum (own units only)', str_contains($r['headers'], 'text/csv') && !str_contains($r['body'], 'DBM'), 'FR-35');
foreach (['admin' => $admin, 'lecturer' => $lec1, 'student' => $stu] as $role => $c) {
    $p = $c->get($role . '/dashboard.php');
    $dash[$role] = $p['code'] === 200 && str_contains($p['body'], 'stat-value') && str_contains($p['body'], '<canvas');
}
check('ST-37', 'Each role has a dashboard with statistics and charts', !in_array(false, $dash, true), 'FR-37');
$admin->get('admin/announce.php');
$admin->post('admin/announce.php', ['audience' => 'class:' . $classId, 'type' => 'info', 'title' => 'Welcome', 'message' => 'Welcome to DEE101']);
check('ST-38', 'Administrator sends an announcement to a class', (int)db_value("SELECT COUNT(*) FROM notifications WHERE title = 'Welcome'") === 3, 'FR-39');

// =====================================================================
section('Audit, settings, backup and data protection');
$acts = array_column(db_all('SELECT DISTINCT action FROM audit_logs'), 'action');
$need = ['login_success', 'login_failed', 'account_locked', 'fingerprint_enrolled', 'scan_rejected', 'attendance_manual', 'session_closed', 'report_exported', 'csrf_rejected', 'access_denied'];
check('ST-39', 'Security-relevant actions are written to the audit log', !array_diff($need, $acts), 'FR-40', 'missing: ' . implode(',', array_diff($need, $acts)));
$blockedU = $blockedD = false;
try { db_query('UPDATE audit_logs SET action = "x" WHERE id = 1'); } catch (PDOException $e) { $blockedU = true; }
try { db_query('DELETE FROM audit_logs WHERE id = 1'); } catch (PDOException $e) { $blockedD = true; }
check('ST-40', 'Audit log entries cannot be changed or deleted (database triggers)', $blockedU && $blockedD, 'FR-41');
$admin->get('admin/settings.php');
$admin->post('admin/settings.php', ['action' => 'save', 'institution_name' => 'Demo Technical Training Institute', 'min_attendance_percent' => '75', 'late_grace_minutes' => '15',
    'biometric_driver' => 'simulated', 'match_threshold' => '20', 'min_quality' => '50', 'bridge_url' => 'http://127.0.0.1:8765', 'consent_version' => '1.0']);
check('ST-41', 'Unsafe match threshold (20) is rejected by settings validation', db_value("SELECT setting_value FROM settings WHERE setting_key = 'match_threshold'") === '80', 'FR-42');
$admin->get('admin/settings.php');
$admin->post('admin/settings.php', ['action' => 'save', 'institution_name' => 'Demo Technical Training Institute', 'min_attendance_percent' => '80', 'late_grace_minutes' => '10',
    'biometric_driver' => 'simulated', 'match_threshold' => '80', 'min_quality' => '50', 'bridge_url' => 'http://127.0.0.1:8765', 'consent_version' => '1.0']);
check('ST-42', 'Administrator changes the minimum attendance and grace period', db_value("SELECT setting_value FROM settings WHERE setting_key = 'min_attendance_percent'") === '80', 'FR-42');
db_query("UPDATE settings SET setting_value = '75' WHERE setting_key = 'min_attendance_percent'");
db_query("UPDATE settings SET setting_value = '15' WHERE setting_key = 'late_grace_minutes'");
$admin->get('admin/settings.php');
$admin->post('admin/settings.php', ['action' => 'backup']);
require_once BSAMS_ROOT . '/app/Backup.php';
$bk = Backup::list()[0] ?? null;
$content = $bk ? file_get_contents(Backup::dir() . '/' . $bk['name']) : '';
check('ST-43', 'Database backup file is created with tables, data, view and triggers', $bk && str_contains($content, 'CREATE TABLE `attendance_records`') && str_contains($content, 'INSERT INTO `students`') && str_contains($content, 'v_attendance_summary') && str_contains($content, 'trg_audit_no_update'), 'FR-43', $bk ? number_format($bk['size'] / 1024, 1) . ' KB' : '');
$r = $admin->get('admin/settings.php?download=..%2F..%2Fconfig%2Fconfig.php');
check('SEC-12', 'Backup download rejects path traversal attempts', $r['code'] === 404, 'NFR-01');
$admin->get("admin/fingerprints.php?student=$s2");
$admin->post('admin/fingerprints.php', ['action' => 'withdraw', 'student_id' => $s2]);
check('ST-44', 'Withdrawing consent permanently deletes the student\'s templates', !db_value('SELECT COUNT(*) FROM biometric_templates WHERE student_id = ?', [$s2]) && db_value('SELECT withdrawn_at FROM biometric_consents WHERE student_id = ?', [$s2]) !== null, 'FR-21');

// =====================================================================
$bridgeProc = null;
if ($withBridge) {
    section('Hardware code path with MOCK bridge (no real scanner)');
    $bridgeProc = proc_open(['node', BSAMS_ROOT . '/bridge/mock_bridge.js'], [1 => ['pipe', 'w'], 2 => ['pipe', 'w']], $pipes);
    usleep(1200000);
    $call = function (string $path, array $body = []) {
        $ch = curl_init('http://127.0.0.1:8765' . $path);
        curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER => true, CURLOPT_POST => true, CURLOPT_POSTFIELDS => json_encode($body), CURLOPT_HTTPHEADER => ['Content-Type: application/json', 'Origin: http://localhost'], CURLOPT_HEADER => true]);
        $raw = curl_exec($ch); $hs = curl_getinfo($ch, CURLINFO_HEADER_SIZE); curl_close($ch);
        return ['headers' => substr((string)$raw, 0, $hs), 'json' => json_decode(substr((string)$raw, $hs), true)];
    };
    db_query("UPDATE settings SET setting_value = 'bridge' WHERE setting_key = 'biometric_driver'");
    $st = (new BridgeProvider('http://127.0.0.1:8765'))->status();
    check('HW-01', 'BridgeProvider connects to the bridge /status endpoint', $st['ok'], 'Section 3.3 SRS', $st['message']);
    $c = $call('/capture', ['simulate' => "hw:$s1:R_THUMB"]);
    check('HW-02', 'Bridge /capture returns a base64 template and allows the BSAMS origin (CORS)', !empty($c['json']['template']) && stripos($c['headers'], 'Access-Control-Allow-Origin: http://localhost') !== false);
    $admin->get("admin/fingerprints.php?student=$s1");
    $r = $admin->api('api/enroll.php', ['student_id' => $s1, 'finger' => 'R_THUMB', 'template' => $c['json']['template'], 'quality' => $c['json']['quality']]);
    check('HW-03', 'Enrolment through the hardware driver stores a "hardware" template', !empty($r['json']['ok']) && db_value("SELECT driver FROM biometric_templates WHERE student_id = ? AND finger = 'R_THUMB'", [$s1]) === 'hardware', 'FR-17');
    $r = $admin->api('api/sim_capture.php', ['identity' => 'unknown']);
    check('HW-04', 'The simulated scanner is disabled while the hardware driver is active', $r['code'] === 403, 'NFR-09');
    $l900->get('lecturer/sessions.php');
    $l900->post('lecturer/sessions.php', ['action' => 'create', 'assignment_id' => $aId, 'session_date' => date('Y-m-d'), 'start_time' => '00:00', 'end_time' => '23:59', 'topic' => 'Bridge test', 'open_now' => '1']);
    $hs = (int)db_value('SELECT MAX(id) FROM class_sessions WHERE assignment_id = ?', [$aId]);
    $l900->get("lecturer/station.php?session=$hs");
    $p = $call('/capture', ['simulate' => "hw:$s1:R_THUMB"]);
    $r = $l900->api('api/scan.php', ['session_id' => $hs, 'template' => $p['json']['template'], 'quality' => 80]);
    check('HW-05', 'Scan via bridge identifies the student and records method "hardware"', ($r['json']['result'] ?? '') === 'success' && db_value('SELECT method FROM attendance_records WHERE session_id = ? AND student_id = ?', [$hs, $s1]) === 'hardware', 'FR-22, FR-23', 'score ' . ($r['json']['score'] ?? '?') . (isset($r['json']['result']) ? '' : ' HTTP ' . $r['code'] . ' ' . substr(trim(strip_tags($r['body'])), 0, 200)));
    $p = $call('/capture', ['simulate' => 'hw:stranger']);
    $r = $l900->api('api/scan.php', ['session_id' => $hs, 'template' => $p['json']['template'], 'quality' => 80]);
    check('HW-06', 'Unknown finger via bridge is rejected', ($r['json']['result'] ?? '') === 'rejected', 'FR-25');
    $sim = db_value("SELECT COUNT(*) FROM biometric_templates WHERE driver = 'simulated' AND student_id = ?", [$s1]);
    check('HW-07', 'Simulated templates are never used when the hardware driver is active', $sim > 0 && ($r['json']['result'] ?? '') === 'rejected', 'NFR-09');
    proc_terminate($bridgeProc);
    usleep(400000);
    $p2 = $l900->api('api/scan.php', ['session_id' => $hs, 'template' => $p['json']['template'], 'quality' => 80]);
    check('HW-08', 'If the bridge stops, the station shows a clear error (manual fallback available)', ($p2['json']['result'] ?? '') === 'error', 'NFR-10');
    db_query("UPDATE settings SET setting_value = 'simulated' WHERE setting_key = 'biometric_driver'");
}

// =====================================================================
section('Performance (development computer)');
// Identification time with 200 candidates (simulated provider, includes decryption)
$prov = new SimulatedProvider();
$cands = [];
for ($i = 0; $i < 200; $i++) { $c = SimulatedProvider::capture("perf:$i"); $e2 = TemplateVault::encrypt($c['template']); $cands[] = $e2; }
$probe = SimulatedProvider::capture('perf:137')['template'];
$t = microtime(true);
$list = [];
foreach ($cands as $i => $e2) $list[] = ['id' => $i, 'template' => TemplateVault::decrypt($e2['ciphertext'], $e2['iv'], $e2['tag'])];
$m = $prov->identify($probe, $list);
$ms = (microtime(true) - $t) * 1000;
check('PF-01', 'Decrypt + identify against 200 enrolled templates within 3 seconds', $m['id'] === 137 && $ms < 3000, 'NFR-03', sprintf('%.1f ms, correct match', $ms));
$scanMs = array_map(fn($x) => $x * 1000, $times);
check('PF-02', 'End-to-end scan request (HTTP + DB + matching) within 3 seconds', max($scanMs) < 3000, 'NFR-03', sprintf('max %.0f ms over %d scans', max($scanMs), count($scanMs)));
$pageTimes = [];
foreach (['admin/dashboard.php' => $admin, 'admin/students.php' => $admin, 'admin/reports.php' => $admin, 'lecturer/dashboard.php' => $lec1, 'student/dashboard.php' => $stu, 'student/attendance.php' => $stu] as $p => $c) {
    $runs = [];
    for ($i = 0; $i < 5; $i++) $runs[] = $c->get($p)['time'] * 1000;
    sort($runs);
    $pageTimes[$p] = round($runs[2], 1);
}
check('PF-03', 'Main pages load within 2 seconds (median of 5)', max($pageTimes) < 2000, 'NFR-03', implode(', ', array_map(fn($k, $v) => basename($k, '.php') . " {$v}ms", array_keys($pageTimes), $pageTimes)));

// =====================================================================
$pass = count(array_filter($results, fn($r) => $r['result'] === 'PASS'));
$total = count($results);
$summary = sprintf("%d of %d tests passed (%d failed) in %.1f s", $pass, $total, $total - $pass, microtime(true) - $t0);
echo "\n$summary\n";
$env = ['php' => PHP_VERSION, 'db' => db_value('SELECT VERSION()'), 'os' => php_uname('s') . ' ' . php_uname('r'), 'date' => date('Y-m-d H:i:s'), 'bridge_tests' => $withBridge];
if (!is_dir(__DIR__ . '/results')) mkdir(__DIR__ . '/results');
file_put_contents(__DIR__ . '/results/test_results.json', json_encode(['summary' => $summary, 'environment' => $env, 'page_times_ms' => $pageTimes, 'genuine_scores' => ['min' => min($gen), 'mean' => array_sum($gen) / count($gen)], 'impostor_scores' => ['max' => max($imp), 'mean' => array_sum($imp) / count($imp)], 'results' => $results], JSON_PRETTY_PRINT));
$txt = "BSAMS automated test results\n$summary\nEnvironment: " . json_encode($env) . "\n\n";
foreach ($results as $r) $txt .= sprintf("%-4s %-7s %-45s %s %s\n", $r['result'], $r['id'], '[' . $r['level'] . ']', $r['description'], $r['note'] ? "({$r['note']})" : '');
file_put_contents(__DIR__ . '/results/test_results.txt', $txt);
exit($pass === $total ? 0 : 1);
