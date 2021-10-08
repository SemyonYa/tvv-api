<?php

namespace app\controllers;

class PlaceController extends RestController
{

    public $modelClass = 'app\models\Place';

    public function actions()
    {
        $actions = parent::actions();
        // unset($actions['create'], $actions['delete']);
        return $actions;
    }
}
