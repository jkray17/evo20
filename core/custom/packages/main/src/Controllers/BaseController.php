<?php

namespace EvolutionCMS\Main\Controllers;

use Illuminate\Support\Facades\Cache;
//Базовый класс который занимается обработкой/кэшированием и прочими вещами.
class BaseController
{
    public $data = [];

    public function __construct()
    {
        $this->evo = EvolutionCMS();
        ksort($_GET);
        $cacheid = md5(json_encode($_GET));
        if ($this->evo->getConfig('enable_cache')) {
            $this->data = Cache::rememberForever($cacheid, function () {
                $this->globalElements();
                $this->render();
                return $this->data;
            });
        } else {
            $this->globalElements();
            $this->render();
        }
        $this->noCacheRender();
        $this->sendToView();
    }

    public function render()
    {
        $this->data['test'] = 'test data';
    }

    public function noCacheRender()
    {
    }

    public function globalElements()
    {
        $this->data['meta'] = [
            'title' => $this->evo->parseDocumentSource($this->evo->documentObject['titl']['1']),
            'desc' => $this->evo->parseDocumentSource($this->evo->documentObject['desc']['1']),
            'keyw' => $this->evo->parseDocumentSource($this->evo->documentObject['keyw']['1']),
            'noindex' => $this->evo->parseDocumentSource($this->evo->documentObject['noIndex']['1'])
        ];
        $this->data['topmenu'] = json_decode($this->evo->runSnippet('DLMenu', ['parents' => 0, 'maxDepth' => 2, 'api' => 1]), true)[0];

        $this->data['crumbs'] = json_decode($this->evo->runSnippet('DLCrumbs', ['api' => 1, 'showCurrent' => 1, 'addWhereList' => 'alias_visible=1']), true);
    }

    public function sendToView()
    {
        $this->evo->addDataToView($this->data);
    }

    public function DocLister($data) {
        $data['saveDLObject'] = '_DL';
        $this->evo->runSnippet('DocLister', $data);
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