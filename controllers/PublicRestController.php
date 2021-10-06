<?php

namespace app\controllers;

use yii\rest\Controller;

abstract class PublicRestController extends Controller
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::class,
            'cors' => [
                'Origin' => [
                    'http://localhost:4200',
                    'http://localhost:4201',
                    'http://ortum.injini.ru',
                    'http://cab.ortum.injini.ru'
                ],
                'Access-Control-Allow-Origin' => true,
                'Access-Control-Allow-Credentials' => true,
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Allow-Headers' => ['Origin', 'Content-Type', 'Authorization', 'x-compress']
            ],
        ];

        return $behaviors;
    }

    protected function modelErrorsTo422Response($errors, $custom_error = null)
    {
        if ($custom_error) {
            array_unshift($errors, ['message' => $custom_error]);
        }
        $response_errors = [];
        foreach ($errors as $error) {
            foreach ($error as $error_item) {
                $response_errors[] = [
                    'message' => $error_item
                ];
            }
        }
        return $response_errors;
    }
}
