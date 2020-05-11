
<h1>Видео <a href="https://www.youtube.com/watch?v=HI09PmCF67U">Evolution CMS 2.0 Lessons: Controllers</a></h1>
<h2> Мню такое:</h2>

@foreach($topmenu as $item)
  <li>
    <a href="{{ $item['url'] }}">{{ $item['title'] }}</a>
    <small>@if( $item['active'] == 1 || $item['here'] == 1) ** @endif</small>
    @if(is_array($item['children']))
      @foreach($item['children'] as $item)
        <a href="{{ $item['url'] }}">{{ $item['title'] }}</a>
        <small>@if( $item['active'] == 1 || $item['here'] == 1) *** @endif</small>
      @endforeach

    @endif
  </li>
@endforeach

<h2>ХлебныКрошки</h2>
@foreach($crumbs as $item)
  @if($loop->last)
    <span>{{ $item['title'] }}</span>
  @else
    <a href="@makeUrl($item['id">{{ $item['title'] }}</a>
  @endif
@endforeach

<h1>Видео <a href="https://www.youtube.com/watch?v=HI09PmCF67U">Evolution CMS 2.0 Lessons: Packages</a></h1>

<p>Chunks:</p>
<p>{{$modx->getChunk('main#chunk')}}</p>
<div style="text-align: center; width: 400px">Вызов Snippet из папки пакета майн, получаем и обрабатываем блейдом массив:
@foreach ( $modx->runSnippet('main#snippet') as $item)
  <p>Это элемент массива: {{ $item }}</p>
@endforeach
</div>

<hr>
<div class="">
  Плагины из файлов
</div>
<p>Метатеги из BaseController:</p>
<h5>Title: </h5>{{ $meta['title'] }}
<h5>desc: </h5>{{ $meta['desc'] }}
<h5>keyw: </h5>{{ $meta['keyw'] }}
<h5>noindex: </h5>{{ $meta['noindex'] }}


<h1>Видео <a href="https://www.youtube.com/watch?v=n4oX8Y-zX_k&t=1429s">Evolution CMS 2.0 Lessons: Templates Part 1</a></h1>
<h2>{{ $documentObject['pagetitle'] }}</h2>
<p>$documentObject['*content*'] Результат:</p>
<p>$documentObject['*content*'] Результат:</p>



@evoParser(' [*content*]  <h3>DOcInfo:</h3>[[DocInfo]]' )<hr>

@evoParser(' ID: [*id*] <span><strong>DOcInfo:</strong></span>[[DocInfo]]' )
  <span><strong>URL @makeUrl('2'):</strong></span>
<p>@makeUrl('2')</p>

<p>Конфиг site_name: {{ $modx->getConfig('site_name')}}</p>
@evoParser(' <span>site_name: </span>[(site_name)]' )

<p>$modx->runsnippet('DocInfo', ['docid'=>'2']) Результат:</p>
<p>{{ $modx->runsnippet('DocInfo', ['docid'=>'2']) }}</p>

<p>Кеширование вызова на 600 сек с экранированием служ символов (0 - кешировать навсегда), кеш только для текущего документа:</p>
<p>{{ $modx->runSnippet('DocInfo', ['docid'=>'2', 'field'=>'content'], '600', 'test') }}</p>

<p>Кеширование вызова на 600 сек без экранирования служ символов. Для кеширования фрагмента на ресурсах, где есть ключ cache_key:</p>
<!-- <p>{!! $modx->runSnippet('DocInfo', ['docid'=>'2', 'field'=>'content'], '777', 'cache_key') !!}</p> -->

<hr>
{!! $modx->runSnippet('DocLister',[
  'parents' => '2',
  'tpl' => '@CODE: <span>Страница:</span> [+pagetitle+]<br>'
  ])
!!}

<hr>
<ul>
{!! $modx->runSnippet('DocLister',[
  'parents' => '2',
  'tpl' => '@B_FILE:test_tpl'
  ])
!!}
</ul>
