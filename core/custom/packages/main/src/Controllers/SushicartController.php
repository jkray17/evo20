<?php
namespace EvolutionCMS\Main\Controllers;

class SushicartController extends BaseController {
  public function render()
    {
        $this->data['test'] = 'Суши Контроллер';

        $this->data['newsitems'] = $this->DocLister([
          'parents' => 53,
          'display' => 2,
          'paginate' => 'pages',
          'tvList'=>'sushi_img, sushi_desc, sushi_price, sushi_amount',
        ]);

        $this->data['productitems'] = $this->Cart([
          'instance' => 'products'

        ]);
    }

  public function Cart($data) {
        $data['saveDLObject'] = '_DL';
        $this->evo->runSnippet('Cart', $data);
        $_DL = $this->evo->getPlaceholder('_DL');
        $docs = $_DL->docsCollection()->toArray();

        $pages = [];
        if (isset($data['paginate']) && $data['paginate'] != '') {
            $paginator = $_DL->getExtender('paginate');
            $pages = [
                'first' => 1,
                'last' => $paginator->totalPage(),
                'current' => $paginator->currentPage(),
                'total' => $paginator->totalDocs(),
            ];
        }
        return [
            'docs' => $docs,
            'pages' => $pages,
        ];
    }
}