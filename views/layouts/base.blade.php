<!DOCTYPE html>
<html lang="ru-RU">
  <head>
    <meta charset="utf-8">
    <base href=@evoParser('[(site_url)]')>
    <title>@yield('title')</title>
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
          <li><a href="">КонтактЫ</a></li>
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

    @section('crumbs')
    <h2>Хлебны Крошки</h2>
      @foreach($crumbs as $item)
        @if($loop->last)
          <span>{{ $item['title'] }}</span>
        @else
          <a href="@makeUrl($item['id'])"> {{ $item['title'] }}</a>
          <span> > </span>
        @endif
      @endforeach
    @show

    <h1>@yield('pagetitle')</h1>
    <h1>@yield('test')</h1>

  <!-- @yield('crumbs') -->
  <div class="content">
    @yield('content')
  </div>

    <script src="theme/js/main.js"></script>
  </body>
</html>