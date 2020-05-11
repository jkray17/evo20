@extends('layouts.base')

@section('title', $meta['title'])


@section('content')
<h2>БЛОГ</h2>
<p>$test: {{$test}}</p>
  <h4>Тут должны быть итемы блога</h4>
<div class="news_block">


  @foreach($newsitems['docs'] as $item)

    @include('partials.newsitem', ['item'=>$item])

  @endforeach

</div>
<div class="paginate">
  @include('partials.paginate', ['paginate' => $newsitems['pages']])
</div>
@endsection