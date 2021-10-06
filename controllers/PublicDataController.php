<?php

namespace app\controllers;

use app\models\Ctor;
use app\models\Image;

class PublicDataController extends PublicRestController
{

    public function actionRegion($id)
    {
        return Ctor::find()->where(['tag' => 'region', 'id' => $id])->one();
    }

    public function actionPlaces($region_id)
    {
        return Ctor::find()->where(['tag' => 'place', 'region_id' => $region_id])->all();
    }

    public function actionPlace($id)
    {
        return Ctor::find()->where(['tag' => 'place', 'id' => $id])->one();
    }

    public function actionObjects($place_id)
    {
        return Ctor::find()->where(['tag' => 'object', 'place_id' => $place_id])->all();
    }

    public function actionObject($id)
    {
        return Ctor::find()->where(['tag' => 'object', 'id' => $id])->one();
    }

    public function actionImages($object_id, $is_before = false)
    {
        return Image::find()->where(['object_id' => $object_id, 'is_before' => $is_before])->all();
    }
}
