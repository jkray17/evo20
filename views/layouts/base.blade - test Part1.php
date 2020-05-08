Hello all!!!!!!!!!!!!!!!
[*content*]

<h1>{{ $documentObject['pagetitle'] }}</h1>
<h1>``{{ $documentObject['*content*'] }}</h1>
@evoParser(' [*content*]  <h3>DOcInfo:</h3>[[DocInfo]]' )
@evoParser(' ID: [*id*]  <h3>DOcInfo:</h3>[[DocInfo]]' )
<p>@makeUrl('2')</p>
<p>Конфиг site_name: {{ $modx->getConfig('site_name')}}</p>
@evoParser(' <span>site_name: </span>[(site_name)]' )