<?php
echo $modx->getConfig( 'site_name');
// echo $modx->getConfig( name 'site_name'); - почему наме не робит?
// Получить id модуля:
echo 'id module:', '<br>';
echo md5('module from file');