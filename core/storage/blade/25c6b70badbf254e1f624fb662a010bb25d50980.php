<?php $__env->startSection('title', '&&& СУШИ !!!Главная страница'); ?>

<?php $__env->startSection('pagetitle', 'Бесплатная доставка роллов от портала «Еда в Рязани»'); ?>

<?php $__env->startSection('content'); ?>
  <div class="content">
    <div class="main-content">
      <?php echo $__env->make('sushi.partials.productitem', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
  </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.base', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\OSPanel\domains\evo20\views/sushi_item.blade.php ENDPATH**/ ?>