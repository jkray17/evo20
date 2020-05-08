<form action="#" data-commerce-action="add">
    {{-- <input type="hidden" name="id" value="[*id*]"> --}}
    <input type="text" name="id" value="[*id*]">
    <input type="number" name="count" value="1">
    <div class="product-bottom">
      <span class="price">
        {{ $item['tv.sushi_price']}} Р
      </span>

    <button type="submit" class="product-buy">В корзину</button>
    </div>
</form>
