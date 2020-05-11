<div class="products_list">
        <input class="sort-radio" id="all" type="radio" name="sort-radio" checked>
        <input class="sort-radio" id="tunec" type="radio" name="sort-radio">
        <input class="sort-radio" id="ostr" type="radio" name="sort-radio">
        <input class="sort-radio" id="vegan" type="radio" name="sort-radio">
        <div class="tags">
          <label class="tag" for="all">Все</label>
          <label class="tag" for="tunec">С тунцом</label>
          <label class="tag" for="ostr">Острые</label>
          <label class="tag" for="vegan">Веганские</label>
        </div>

          <h3>Test products</h3>
        <div class="products">
        @foreach($newsitems['docs'] as $item)
          <div class="product product-wrap" data-product-type="ostr">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('{{ $item['tv.sushi_img']}}') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">{{ $item['pagetitle']}}</a>
                <p>ID: {{ $item['id']}}</p>
                <p class="product-desc">

                  {{ $item['tv.sushi_desc']}}

                  <br><span>{{ $item['tv.sushi_amount']}}</span></p>
              </div>
            </div>

            @include('sushi.partials.productitem')

            {{--
            <div class="product-bottom">
              <span class="price">
              {{ $item['tv.sushi_price']}} Р
              </span>
              <a class="product-buy" href="#">В корзину</a></div>--}}
          </div>
        @endforeach
        </div>

        <div class="products">
          {{-- @include('sushi.partials.productitem') --}}

          <div class="product product-wrap" data-product-type="ostr">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0015.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Ясай (веган-ролл)</a>
                <p class="product-desc">Рис, нори, лист салата, болгарский перец, огурец, помидор, кунжут, соус «Терияки»<br><span>250 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">1425 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="tunec">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0019.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Акинава (делать черно-красным 50х50 в икре)</a>
                <p class="product-desc">Икра  «Тобико», рис, нори, креветка тигровая, лосось, сливочный сыр<br><span>320 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">225 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="vegan">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0047.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Хищник</a>
                <p class="product-desc">Темпура, рис, нори, тунец, помидор, соус «спайси», соус «Секай»<br><span>280 грамм / 6 штучек</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">258 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="tunec">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0019.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Акинава (делать черно-красным 50х50 в икре)</a>
                <p class="product-desc">Икра  «Тобико», рис, нори, креветка тигровая, лосось, сливочный сыр<br><span>320 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">225 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="vegan">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0001.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Калифорния с угрём</a>
                <p class="product-desc">Икра "Тобико", рис, нори, угорь, сливочный сыр, огурец<br><span>320 грамм / 6 штучек</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">4250 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="ostr">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0015.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Ясай (веган-ролл)</a>
                <p class="product-desc">Рис, нори, лист салата, болгарский перец, огурец, помидор, кунжут, соус «Терияки»<br><span>250 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">1425 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="vegan">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0001.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Калифорния с угрём</a>
                <p class="product-desc">Икра "Тобико", рис, нори, угорь, сливочный сыр, огурец<br><span>320 грамм / 6 штучек</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">4250 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="tunec">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0003.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Филадельфия с огурцом</a>
                <p class="product-desc">Лосось, рис, нори, сливочный сыр, огурец<br><span>320 грамм / 6 штучек</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">425 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="ostr">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0015.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Ясай (веган-ролл)</a>
                <p class="product-desc">Рис, нори, лист салата, болгарский перец, огурец, помидор, кунжут, соус «Терияки»<br><span>250 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">1425 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
          <div class="product product-wrap" data-product-type="tunec">
            <div class="product-top"><a href="#">
                <div class="product-photo" style="background: url('theme/images/content/0019.jpg') no-repeat; background-size: contain"></div></a>
              <div class="product-text"><a class="product-name" href="#">Акинава (делать черно-красным 50х50 в икре)</a>
                <p class="product-desc">Икра  «Тобико», рис, нори, креветка тигровая, лосось, сливочный сыр<br><span>320 грамм</span></p>
              </div>
            </div>
            <div class="product-bottom"><span class="price">225 Р</span><a class="product-buy" href="#">В корзину</a></div>
          </div>
        </div>
      </div>