<?php
require __DIR__ . '/../app/bootstrap.php';
require_role('admin');
$scopeLecturer = null; // administrators see all units
require BSAMS_ROOT . '/app/reports_view.php';
