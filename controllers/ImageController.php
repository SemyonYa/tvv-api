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

        unset($actions['create'], $actions['update']);

        return $actions;
    }

    public function actionCreate()
    {
        $images = [];
        $model = new UploadForm();

        try {
            if (Yii::$app->request->isPost) {
                $model->files = UploadedFile::getInstancesByName('files');
                if ($imageNames = $model->upload()) {
                    foreach ($imageNames as $name) {
                        $image = new Image($name);
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
