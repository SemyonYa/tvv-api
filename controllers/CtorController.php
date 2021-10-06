<?php

namespace app\controllers;

use app\models\Ctor;
use app\models\CtorItem;
use Throwable;
use Yii;
use yii\web\NotFoundHttpException;

class CtorController extends RestController
{
    public $modelClass = 'app\models\Ctor';

    public function actions()
    {
        $actions = parent::actions();

        unset($actions['create']);

        return $actions;
    }

    public function actionByTag($tag, $region = '')
    {
        // return $region;
        $query = Ctor::find()->where(['tag' => $tag]);
        if ($region) {
            $query = $query->andWhere(['region' => $region]);
        }
        return $query->all();
    }

    public function actionChildren($id)
    {
        $items = Yii::$app->request->post('items');

        // if (!$items) throw new NotFoundHttpException();

        $ctor_items = [];
        for ($index = 0; $index < count($items); $index++) {
            $ctor_item = new CtorItem();
            $ctor_item->type = $items[$index]['type'];
            $ctor_item->value = '' . $items[$index]['value'];
            $ctor_item->ctor_id = $id;
            $ctor_item->ordering = $index;
            if ($ctor_item->validate()) {
                $ctor_items[] = $ctor_item;
            } else {
                return $ctor_item->errors;
            }
            // $ctor_item->validate();
            // return $ctor_item->errors;
            // if (!$ctor_item->save()) {
            //     $errors = $ctor_item->errors;
            //     Yii::$app->response->setStatusCode(422);
            //     return $this->modelErrorsTo422Response($errors, 'Constructor item #' . $index . ' has errors:');
            // }
        }

        if (count($items) !== count($ctor_items)) {
            Yii::$app->response->setStatusCode(422);
            return $this->modelErrorsTo422Response([], 'Constructor items have errors');
        }
        try {
            CtorItem::deleteAll(['ctor_id' => $id]);
            for ($index = 0; $index < count($ctor_items); $index++) {
                $ctor_items[$index]->save();
            }
        } catch (Throwable $th) {
            throw $th;
        }

        return $ctor_items;
    }


    public function actionCreate()
    {
        // return $this->userId;

        // try {
        $ctor = new Ctor();

        // $ctor->id = Yii::$app->request->post('id');
        $ctor->title = Yii::$app->request->post('title');
        $ctor->subtitle = Yii::$app->request->post('subtitle');
        $ctor->description = Yii::$app->request->post('description');
        $ctor->created_at = Yii::$app->request->post('created_at');
        $ctor->author_name = Yii::$app->request->post('author_name');
        $ctor->author_id = $this->userId; // Yii::$app->request->post('author_id');
        $ctor->thumb_id = Yii::$app->request->post('thumb_id');
        $ctor->price = Yii::$app->request->post('price');
        $ctor->region = Yii::$app->request->post('region');
        $ctor->is_active = Yii::$app->request->post('is_active');
        $ctor->tag = Yii::$app->request->post('tag');

        if ($ctor->save()) {
            return $ctor;
        } else {
            return $ctor->errors;
        }

        return false;

        // return $ctor->validate();
        // if ($ctor->save()) {
        //     $items = Yii::$app->request->post('items');
        //     for ($index = 0; $index < count($items); $index++) {
        //         $ctor_item = new CtorItem();
        //         // $ctor_item->id = $items[$index]['id'];
        //         $ctor_item->type = $items[$index]['type'];
        //         $ctor_item->value = $items[$index]['value'];
        //         $ctor_item->ctor_id = $ctor->id;
        //         $ctor_item->ordering = $index;
        //         $ctor_item->validate();
        //         // return $ctor_item->errors;
        //         if (!$ctor_item->save()) {
        //             $errors = $ctor_item->errors;
        //             Yii::$app->response->setStatusCode(422);
        //             return $this->modelErrorsTo422Response($errors, 'Constructor item #' . $index . ' has errors:');
        //         }
        //     }
        //     return true;
        // } else {
        //     Yii::$app->response->setStatusCode(422);
        //     return $this->modelErrorsTo422Response($ctor->errors);
        // }
        // } catch (Throwable $th) {
        //     throw $th;
        // }


        // throw new ServerErrorHttpException();
    }
}
