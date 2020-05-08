<?php $__env->startSection('title', $meta['title']); ?>



<?php $__env->startSection('pagetitle', 'Бесплатная доставка роллов от портала «Еда в Рязани»'); ?>


 <div class="main-content">
  <?php $__env->startSection('content'); ?>

    <?php echo $__env->make('sushi.catalogue', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <!-- .products-->
    <!--   include ../pug/modules/products/prod1-->
    <!--   include ../pug/modules/products/prod2-->
    <!--   include ../pug/modules/products/prod3-->
    <!--   include ../pug/modules/products/prod4-->
    <!--   include ../pug/modules/products/prod5-->
    <!--   .product(data-product-type='vegan').product-wrap-->
    <!--       .product-top-->
    <!--         a(href='#')-->
    <!--           .product-photo(style="background: url('theme/images/content/0003.jpg') no-repeat; background-size: contain")-->
    <!--         .product-text-->
    <!--           a.product-name(href='#') Филадельфия с огурцом-->
    <!--           p.product-desc-->
    <!--             | Лосось, рис, нори, сливочный сыр, огурец-->
    <!--             br-->
    <!--             span 320 грамм / 6 штучек-->
    <!--       .product-bottom-->
    <!--         a.product-buy(href='#') В корзину-->
    <!--         span.price 425 Р-->

<?php $__env->stopSection(); ?>
</div>
<?php echo $__env->make('layouts.base', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\OSPanel\domains\evo20\views/sushi.blade.php ENDPATH**/ ?>