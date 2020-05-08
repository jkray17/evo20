<?php
namespace EvolutionCMS\Main\Controllers;

class HomeController extends BaseController {
  public function render()
    {
        parent::render(); // для наследования ибо переписывает весь блок функции?
        // $this->data['test'] = 'Страница HiLO pok';

        $this->$data['newsitems'] = $this->Doclister([
          'parents' => 2,
          'display' => 2,
          'paginate' => 'pages',
        ]);
    }
}