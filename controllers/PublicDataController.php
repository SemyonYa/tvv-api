<?php

namespace app\controllers;

use app\models\Ctor;
use app\models\Image;
use app\models\Place;
use app\models\Project;

class PublicDataController extends PublicRestController
{

    // public function actionRegion($id)
    // {
    //     return Ctor::find()->where(['tag' => 'region', 'id' => $id])->one();
    // }

    public function actionPlaces($region)
    {
        return Place::find()->where(['region' => $region])->all();
    }

    public function actionPlace($id)
    {
        return Place::find()->where(['id' => $id])->one();
    }

    // public function actionObjects($place_id)
    // {
    //     return Ctor::find()->where(['tag' => 'object', 'place_id' => $place_id])->all();
    // }

    public function actionProject($id)
    {
        return Project::find()->where(['id' => $id])->one();
    }

    // public function actionImages($object_id, $is_before = false)
    // {
    //     return Image::find()->where(['object_id' => $object_id, 'is_before' => $is_before])->all();
    // }
}
