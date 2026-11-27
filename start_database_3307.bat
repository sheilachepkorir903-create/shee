@echo off
REM Starts XAMPP's MariaDB on port 3307 (used when port 3306 is taken by another MySQL service).
REM Keep this window open while using BSAMS. Close it (or press Ctrl+C) to stop the database.
title BSAMS database (XAMPP MariaDB on port 3307)
cd /d C:\xampp\mysql\bin
echo Starting XAMPP MariaDB on port 3307 ... (keep this window open)
mysqld.exe --defaults-file=C:\xampp\mysql\bin\my.ini --port=3307 --standalone --console
pause
