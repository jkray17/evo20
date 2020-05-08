<!DOCTYPE html>
<html lang="ru-RU">
  <head>
    <meta charset="utf-8">
    <base href=<?php echo evo_parser('[(site_url)]');?>>
    <title><?php echo $__env->yieldContent('title'); ?></title>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE = edge"><![endif]-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="keywords" content=""><link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,700&amp;display=swap&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
    <!-- <link rel="stylesheet" type="text/css" href="theme/css/reset.css"> -->
    <link rel="stylesheet" type="text/css" href="theme/css/style.min.css">
  </head>
  <body>
    <header class="header">
      <div class="topmenu">
        <div class="logo"><a href="sushi-ryazan.html"><img src="theme/images/general/logo.png"></a></div>
        <ul class="unvisible menu">
          <li class="active"><a href="sushi-ryazan.html">Главная</a></li>
          <li><a href="">О нас</a></li>
          <li><a href="">Доставка</a></li>
          <li><a href="">Контакты</a></li>
        </ul>
        <div class="cartblock">
          <div class="cart-info">
            <p>1 500 Р</p>
            <p class="orange">3 порции</p>
          </div><a class="cart" href="sushi-ryazan/zakaz.html">Корзина</a>
          <div class="phone"><a href="">+7 (915) 620 73 41</a>
            <p>Доставка: с 09:00 до 23:00</p>
          </div>
        </div><div class="menu-btn sandwich"><span></span></div>
      </div>
    </header>

    <?php $__env->startSection('crumbs'); ?>
    <h2>Хлебны Крошки</h2>
      <?php $__currentLoopData = $crumbs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <?php if($loop->last): ?>
          <span><?php echo e($item['title']); ?></span>
        <?php else: ?>
          <a href="<?php echo app("UrlProcessor")->makeUrl($item['id']);?>"> <?php echo e($item['title']); ?></a>
          <span> > </span>
        <?php endif; ?>
      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <?php echo $__env->yieldSection(); ?>

    <h1><?php echo $__env->yieldContent('pagetitle'); ?></h1>
    <h1><?php echo $__env->yieldContent('test'); ?></h1>

  <!-- <?php echo $__env->yieldContent('crumbs'); ?> -->
  <div class="content">
    <?php echo $__env->yieldContent('content'); ?>
  </div>

    <script src="theme/js/main.js"></script>
  </body>
</html><?php /**PATH E:\OSPanel\domains\evo20\views/layouts/base.blade.php ENDPATH**/ ?>