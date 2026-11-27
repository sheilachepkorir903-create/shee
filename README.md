# BSAMS – Biometric-Based Student Attendance Management System

A web-based system for colleges and TVET institutions that records class attendance by
fingerprint, built with **PHP 8, MySQL/MariaDB, HTML5, CSS3, JavaScript and Bootstrap 5** on XAMPP.

- **Administrator:** departments, courses, classes, units, students (incl. CSV import), lecturers,
  unit allocation & registration, consent + fingerprint enrolment, attendance records, reports,
  user accounts, announcements, audit logs, settings & backup.
- **Lecturer:** dashboard, units & students, attendance sessions, full-screen attendance station
  with live list, manual fallback marking, history, reports (CSV/print).
- **Student:** dashboard with charts, attendance percentages and history, notifications, profile.

Biometrics: all fingerprint operations go through `app/Biometric/BiometricProvider.php`.
Drivers: **SimulatedProvider** (development/testing – clearly labelled, *not real biometrics*) and
**BridgeProvider** (real USB scanner through a local bridge wrapping the vendor SDK – see
`bridge/README.md`). Templates are AES-256-GCM encrypted; raw images are never stored.

Security: password_hash/verify, PDO prepared statements, CSRF tokens, output escaping, RBAC,
session hardening, lockout, append-only audit log (DB triggers), blocked private folders.

- Install & run: **INSTALL.md**
- Documentation (Chapters 1–5, SRS, proposal): **docs/**
- Tests: `php tests/run_tests.php --bridge` → results in `tests/results/` (97/97 passing)
