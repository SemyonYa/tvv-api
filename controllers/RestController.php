<?php

namespace app\controllers;

use app\models\User;
use Yii;
use yii\filters\auth\HttpBearerAuth;
use yii\rest\ActiveController;

abstract class RestController extends ActiveController
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        // $auth = $behaviors['authenticator'];
        // $behaviors['authenticator'] = ['class' => HttpBearerAuth::class];
        // $controllersWithoutBearer = ['auth'];
        // if (in_array(Yii::$app->controller->id, $controllersWithoutBearer)) {
        //     $behaviors['authenticator'] = $auth;
        // }

        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::class,
            'cors' => [
                'Origin' => [
                    'http://localhost:4200',
                    'http://localhost:4201',
                    // 'http://ortum.injini.ru',
                    'http://cab.ortum.injini.ru'
                ],
                'Access-Control-Allow-Origin' => true,
                'Access-Control-Allow-Credentials' => true,
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Allow-Headers' => ['Origin', 'Content-Type', 'Authorization', 'x-compress']
            ],
        ];

        // avoid authentication on CORS-pre-flight requests (HTTP OPTIONS method)
        $behaviors['authenticator']['except'] = ['options'];

        return $behaviors;
    }

    public function checkAccess($action, $model = null, $params = [])
    {
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

    protected function getUserId()
    {
        $token = Yii::$app->request->headers['Authorization'];
        if ($token && strpos($token, 'Bearer ') === 0) {
            $token = substr($token, 7);
            $user = User::findIdentityByAccessToken($token);
            return $user->id;
        }
        return;
    }
}
