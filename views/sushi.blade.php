@extends('layouts.base')

@section('title', $meta['title'])



@section('pagetitle', 'Бесплатная доставка роллов от портала «Еда в Рязани»!')


 <div class="main-content">
  @section('content')
  <div class="">
    🔴 UPD упрощенная формула (медиа запрос не нужен):
    font-size: calc(24px + 16 * ((100vw - 320px) / (1280 - 320)));</div>

    @include('sushi.catalogue')

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

@endsection
</div>