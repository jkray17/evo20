@if( $paginate['last'] > 1 )
  <ul>
    @if( $paginate['first'] == $paginate['current'])
      <li><span> < </span></li>
    @elseif( $paginate['current'] == 2 )
      <li><a href="@makeUrl($modx->documentIdentifier)&page{{ $paginate['current'] - 1 }}"></a></li>
    @endif

    @for($i = $paginate['first']; $i <= $paginate['last']; $i++)
      @if($i == $paginate['current'])
        <li class="active"> {{$i}} </li>
      @else
        <li><a href="@makeUrl($modx->documentIdentifier)&page{{ $i }}">{{$i}}</a></li>
      @endif
    @endfor

    @if($paginate['last'] == $paginate['current'])
    <la><span> > </span></la>
    @else
    <li><a href="@makeUrl($modx->documentIdentifier)&page{{$paginate['current'] + 1 }}"> > </a></li>
    @endif
  </ul>
@endif