<!DOCTYPE html>
<html lang="ru-RU">
  <head>
    <meta charset="utf-8">
     <base href=@evoParser('[(site_url)]')>
    <title>СУШИ! Корзина</title><!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE = edge"><![endif]-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="keywords" content=""><link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400,500,700&amp;display=swap&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="theme/css/reset.css">
    <link rel="stylesheet" type="text/css" href="theme/css/style.min.css">
  </head>
  <body>
    <header class="header">
      <div class="topmenu">
        <div class="logo"><a href="sushi-ryazan.html"><img src="theme/images/general/logo.png"></a></div>
        <ul class="unvisible menu">
          <li class="active"><a href="sushi-ryazan.html">Главная</a></li>
          <li><a href="#">О нас</a></li>
          <li><a href="#">Доставка</a></li>
          <li><a href="#">Контакты</a></li>
        </ul>
        <div class="cartblock">
          <div class="cart-info">
            <p>1 500 Р</p>
            <p class="orange">3 порции</p>
          </div><a class="cart" href="sushi-ryazan/zakaz.html">Корзина</a>
          <div class="phone"><a href="">+7 (915) 620 73 41</a>
            <p>Доставка: с 09:00 до 23:00</p>
          </div>
        </div><a class="menu-btn sandwich" href="#"><span></span></a>
      </div>
    </header>
    <h1>Корзина</h1>
    <div class="content">
      <div class="cart-left">
        <h2>Контактные данные</h2>
        <input class="cart-input" type="text" placeholder="Как вас зовут?">
        <input class="cart-input" type="text" placeholder="Телефон для связи">
        <h2>Способ доставки</h2>
        <div class="delivery">
          <input id="address" type="radio" name="tab" checked>
          <label for="address">Доставка по адресу</label>
          <input id="self" type="radio" name="tab">
          <label for="self">Заберу сам</label>
          <div class="delivery_wrap">
            <div class="delivery_address">
              <input class="cart-input" type="text" placeholder="Улица">
              <input class="cart-input-small" type="text" placeholder="Дом">
              <input class="cart-input-small" type="text" placeholder="Подъезд">
              <input class="cart-input-small" type="text" placeholder="Этаж">
              <input class="cart-input-small" type="text" placeholder="Квартира">
              <div class="clear"></div>
            </div>
            <div class="delivery_self">
              <div class="delivery-point">
                <p>г. Рязань</p>
                <p>ул. Есенина 18</p>
              </div>
              <div class="ya-map"><script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3Af44bbf904dc12fd3b1ad27a947f0e9f1550ec09e5e87a9cae99c6c5be5634981&amp;width=320&amp;height=300&amp;lang=ru_RU&amp;scroll=true"></script></div>
            </div>
          </div>
        </div><a class="cart-select active" href="#" style="margin-top:20px;">Как можно скорее</a><a class="cart-select" href="#">Ко времени</a>
        <div class="clear"></div>
        <input class="cart-input-small-date" type="text" placeholder="Дата">
        <input class="cart-input-small-date" type="text" placeholder="Время">
        <h2>Есть пожелания или комментарии?</h2>
        <textarea rows="10" cols="45" name="Комментарий"></textarea>
      </div>
      <div class="cart-order">
        <div class="product">
          <div class="product-wrap">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0003.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Калифорния с креветкой</a>
                <p class="product-desc">Лосось, рис, нори, сливочный сыр, огурец</p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">425 Р x 5 = 2 125 Р</span></div>
          </div>
        </div>
        <div class="product">
          <div class="product-wrap">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0003.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Акинава (делать черно-красным 50х50 в икре)</a>
                <p class="product-desc">Икра «Тобико», рис, нори, креветка тигровая, лосось, сливочный сыр</p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">25 Р x 5 = 125 Р</span></div>
          </div>
        </div>
        <div class="product">
          <div class="product-wrap">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0003.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Калифорния с угрём</a>
                <p class="product-desc">Икра "Тобико", рис, нори, угорь, сливочный сыр, огурец</p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">425 Р x 15 = 22 125 Р</span></div>
          </div>
        </div>
        <div class="order_sum">Итого: 4567.20 Р</div>
        <button class="submit">Заказать</button>
      </div>
    </div>
    <script src="theme/js/main.js"></script>
  </body>
</html>