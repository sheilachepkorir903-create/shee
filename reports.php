<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('lecturer');
$scopeLecturer = Auth::lecturerId() ?: -1; // lecturers only see their own units (-1 = none if profile missing)
require BSAMS_ROOT . '/app/reports_view.php';
