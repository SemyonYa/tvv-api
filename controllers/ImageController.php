<?php

namespace app\controllers;

use Yii;
use Throwable;
use yii\web\UploadedFile;

use app\models\Image;
use app\models\UploadForm;

class ImageController extends RestController
{
    public $modelClass = 'app\models\Image';
    public $enableCsrfValidation = false;

    public function actions()
    {
        $actions = parent::actions();

        unset($actions['index'], $actions['create'], $actions['update']);

        return $actions;
    }

    public function actionIndex($project_id = null, $period = null)
    {
        $q = Image::find();
        if ($project_id) {
            $q = $q->where(['project_id' => $project_id]);
        }
        if ($period) {
            $q = $q->andWhere(['period' => $period]);
        }
        return $q->all();
    }

    public function actionCreate()
    {
        $images = [];
        $model = new UploadForm();

        try {
            if (Yii::$app->request->isPost) {
                $model->files = UploadedFile::getInstancesByName('files');
                $project_id = Yii::$app->request->post('project_id');
                $period = Yii::$app->request->post('period');
                // return $project_id;
                if ($imageNames = $model->upload()) {
                    foreach ($imageNames as $name) {
                        $image = new Image($name, $project_id, $period);
                        if ($image->save()) {
                            $image->resizeAndSave();
                            $images[] = $image;
                        }
                    }
                    return $images;
                }
            }
        } catch (Throwable $th) {
            throw $th;
        }
        return false;
    }
}
