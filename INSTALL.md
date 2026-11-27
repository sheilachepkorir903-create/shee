# BSAMS – Installation and Running Guide (beginner friendly)

Biometric-Based Student Attendance Management System
PHP 8 · MySQL/MariaDB · Bootstrap 5 · XAMPP

---

## 1. What you need

| Item | Notes |
|---|---|
| XAMPP (with PHP 8.1 or newer) | https://www.apachefriends.org – install to `C:\xampp` |
| A web browser | Chrome or Edge recommended |
| Visual Studio Code | To read/edit the code |
| Node.js (optional) | Only for the mock scanner bridge and documentation scripts |
| USB fingerprint scanner + its Windows SDK (later) | See `bridge/README.md` |

## 2. Put the project in the right place

XAMPP only serves files inside `C:\xampp\htdocs`. Copy the whole **bsams** folder there:

```
C:\xampp\htdocs\bsams\
    admin\  lecturer\  student\  api\  app\  assets\  bridge\
    config\  database\  docs\  storage\  tests\
    index.php  login.php  ...
```

> Tip (developers only): instead of copying, you can create a link so that edits in your own
> folder appear immediately: open **Command Prompt as Administrator** and run
> `mklink /J C:\xampp\htdocs\bsams "C:\Users\<you>\Desktop\SHEILA\bsams"`

## 3. Start Apache and MySQL

1. Open **XAMPP Control Panel**.
2. Click **Start** next to **Apache** and **MySQL**. Both should turn green.

### If MySQL will not start (port 3306 already in use)

This happens when another MySQL is installed as a Windows service (for example "MySQL80").
Choose ONE option:

- **Option A – use XAMPP on port 3307 (no changes to the other MySQL):**
  double-click `bsams\start_database_3307.bat`. Keep that window open while you use BSAMS.
  `config\config.php` is already set to `'db_port' => 3307`.
- **Option B – stop the other service and use the normal port:** press `Win + R`, type
  `services.msc`, find **MySQL80**, click **Stop**, then start MySQL in XAMPP.
  Open `bsams\config\config.php` and change `'db_port' => 3307` to `'db_port' => 3306`.

## 4. Create the database (one command)

Open **Command Prompt** and run:

```
C:\xampp\php\php.exe C:\xampp\htdocs\bsams\database\setup.php --demo
```

- `--demo` loads fictitious demonstration data (3 lecturers, 22 students, units, past sessions).
  Leave it out for a clean installation.
- The script **creates the database `bsams`**, creates the **biometric encryption key**
  (`storage\keys\biometric.key`) and the **administrator account**, and prints the password.
- WARNING: running setup again deletes and recreates the database.

Alternative without the command line: open http://localhost/phpmyadmin → **Import** →
choose `database\schema.sql` → **Go**. (You must then still run setup.php once to create the
key and the admin account.)

## 5. Open the system

Go to **http://localhost/bsams** and log in.

Demo accounts (only when installed with `--demo`):

| Role | Username | Password |
|---|---|---|
| Administrator | `admin` | `Admin@1234` |
| Lecturer | `LEC001` (also LEC002, LEC003) | `Lecturer@123` |
| Student | `DIT/001/2025` (DIT/001…010/2025, CIT/001…006/2026, DBM/001…006/2025) | `Student@123` |

Change these passwords before showing the system to anyone else.

## 6. Quick tour (simulated scanner)

1. **Administrator → Fingerprint Enrolment** → choose a student → record consent → select a
   finger → click the fingerprint button. (The yellow *SIMULATION MODE* label means the
   fingerprint comes from the virtual scanner, not real hardware.)
2. Log in as **LEC001** → **Attendance Sessions** → click **Open** on today's demo session
   (or create a new one) → the **Attendance Station** opens.
3. In *Virtual scanner* choose a student and click the big fingerprint button:
   green = recorded, amber = already marked, red = not recognised.
4. Click **Close session** – everyone who did not scan is recorded absent.
5. Log in as that student to see the attendance percentage.

## 7. Using a real fingerprint scanner

Read `bridge/README.md`. In short: install the scanner's driver and SDK, run a bridge program
that implements `/status`, `/capture` and `/match` on `http://127.0.0.1:8765`, then go to
**Settings → Fingerprint driver → Hardware bridge**. Re-enrol students with the real scanner.

To test the hardware code path without a scanner: `node bridge\mock_bridge.js`.

## 8. Running the automated tests

```
C:\xampp\php\php.exe C:\xampp\htdocs\bsams\tests\run_tests.php
C:\xampp\php\php.exe C:\xampp\htdocs\bsams\tests\run_tests.php --bridge     (also tests the mock bridge; needs Node.js)
```

The tests **reset the database with demo data** and write results to `tests\results\`.

## 9. Backups

**Settings & Backup → Create backup now** saves a `.sql` file in `storage\backups\`.
Restore with phpMyAdmin (Import) or:

```
C:\xampp\mysql\bin\mysql.exe -u root -P 3307 < storage\backups\bsams_backup_YYYYMMDD_HHMMSS.sql
```

Also copy `storage\keys\biometric.key` to a safe place (e.g. an encrypted USB drive). Without
it, the stored fingerprint templates cannot be decrypted and students must be re-enrolled.

## 10. Before real use (security checklist)

- [ ] Set `'debug' => false` in `config\config.php`.
- [ ] Set a MySQL password for `root` (or create a dedicated user) and put it in `config.php`.
- [ ] Change `sim_secret` in `config.php` and switch the driver to *Hardware bridge*.
- [ ] Serve the site over **HTTPS**.
- [ ] Change or remove all demo accounts (reinstall without `--demo`).
- [ ] Complete a Data Protection Impact Assessment with the institution (Data Protection Act, 2019).
- [ ] Schedule regular backups of the database and the key file.

## 11. Troubleshooting

| Problem | Solution |
|---|---|
| "BSAMS cannot connect to the database" | MySQL not running, or wrong port/password in `config\config.php` |
| Page shows "Not Found" | The folder is not at `C:\xampp\htdocs\bsams`, or `base_url` in config is wrong |
| "Your form expired for security reasons" | Reload the page and submit again (CSRF token expired after logout/login) |
| Account locked | Wait 15 minutes, or an administrator clicks **Unlock** in User Accounts |
| Station says "Cannot reach the fingerprint scanner service" | Bridge not running or wrong Bridge URL in Settings |
| "Biometric encryption key not found" | Run `database\setup.php` (creates the key) |
