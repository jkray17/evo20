<?php
namespace EvolutionCMS\Main\Controllers;

class BlogController extends BaseController {
  public function render()
    {
        $this->data['test'] = 'Страница HiLO';

        $this->data['newsitems'] = $this->DocLister([
          'parents' => 53,
          'display' => 2,
          'paginate' => 'pages',
          'tvList'=>'sushi_img,sushi_desc',
        ]);
    }
}