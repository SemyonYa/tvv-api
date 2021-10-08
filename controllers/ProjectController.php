<?php

namespace app\controllers;

class ProjectController extends RestController
{

    public $modelClass = 'app\models\Project';

    public function actions()
    {
        $actions = parent::actions();
        // unset($actions['create'], $actions['delete']);
        return $actions;
    }
}
