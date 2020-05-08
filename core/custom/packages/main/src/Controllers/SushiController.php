<?php
namespace EvolutionCMS\Main\Controllers;

class SushiController extends BaseController {
  public function render()
    {
        $this->data['test'] = 'Суши Контроллер';

        $this->data['newsitems'] = $this->DocLister([
          'parents' => 53,
          'display' => 2,
          'paginate' => 'pages',
          'tvList'=>'sushi_img, sushi_desc, sushi_price, sushi_amount',
        ]);
    }
}