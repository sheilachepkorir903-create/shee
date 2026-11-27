    </main>
    <footer class="footer small text-muted">
      &copy; <?= date('Y') ?> <?= e(setting('institution_name', 'Institution')) ?> · Biometric-Based Student Attendance Management System
    </footer>
  </div>
</div>
<script src="<?= url('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
<script src="<?= url('assets/js/app.js') ?>"></script>
<?php foreach ($scripts ?? [] as $s): ?>
<script src="<?= url($s) ?>"></script>
<?php endforeach; ?>
</body>
</html>
