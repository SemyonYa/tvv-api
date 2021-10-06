<?php

namespace app\controllers;

class FilialController extends RestController
{

    public $modelClass = 'app\models\Filial';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['create'], $actions['delete']);
        return $actions;
    }
}
