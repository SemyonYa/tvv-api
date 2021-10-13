<?php

namespace app\controllers;

use app\models\CtorItem;
use app\models\Place;
use Throwable;
use Yii;

class PlaceController extends RestController
{

    public $modelClass = 'app\models\Place';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex($region)
    {
        return Place::find()->where(['region' => $region])->all();
    }


    public function actionChildren($id)
    {
        $items = Yii::$app->request->post('items');

        $ctor_items = [];
        for ($index = 0; $index < count($items); $index++) {
            $ctor_item = new CtorItem();
            $ctor_item->type = $items[$index]['type'];
            $ctor_item->value = '' . $items[$index]['value'];
            $ctor_item->parent_id = $id;
            $ctor_item->ordering = $index;
            if ($ctor_item->validate()) {
                $ctor_items[] = $ctor_item;
            } else {
                return $ctor_item->errors;
            }
        }

        if (count($items) !== count($ctor_items)) {
            Yii::$app->response->setStatusCode(422);
            return $this->modelErrorsTo422Response([], 'Constructor items have errors');
        }
        try {
            CtorItem::deleteAll(['parent_id' => $id]);
            for ($index = 0; $index < count($ctor_items); $index++) {
                $ctor_items[$index]->save();
            }
        } catch (Throwable $th) {
            throw $th;
        }

        return $ctor_items;
    }
}
