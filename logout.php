<?php
require __DIR__ . '/app/bootstrap.php';
// Logout only by POST with a valid CSRF token (prevents forced logout via links/images)
if (is_post()) {
    verify_csrf();
    Auth::logout();
    session_start();
    flash('success', 'You have been logged out.');
}
redirect('login.php');
