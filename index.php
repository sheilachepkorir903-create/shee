<?php
require __DIR__ . '/app/bootstrap.php';
redirect(Auth::check() ? Auth::homeFor(Auth::role()) : 'login.php');
