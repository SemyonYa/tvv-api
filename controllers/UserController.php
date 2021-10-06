<?php

namespace app\controllers;

use app\models\User;
use Exception;
use Yii;
use yii\web\BadRequestHttpException;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use yii\web\ServerErrorHttpException;
use yii\web\UnprocessableEntityHttpException;

class UserController extends RestController
{
    public $modelClass = 'app\models\User';

    public function actions()
    {
        $actions = parent::actions();

        unset($actions['create'], $actions['update']);

        return $actions;
    }

    public function actionCreate()
    {
        $user = new User();

        $user->first_name = Yii::$app->request->post('first_name');
        $user->last_name = Yii::$app->request->post('last_name');
        $user->login = Yii::$app->request->post('login');
        $user->role = Yii::$app->request->post('role');
        $user->birth = Yii::$app->request->post('birth');
        $user->activated = Yii::$app->request->post('activated');
        $password = Yii::$app->request->post('password');
        $password_confirm = Yii::$app->request->post('password_confirm');

        if (trim($password) !== '' && trim($password_confirm) !== '' && $password === $password_confirm) {
            $user->password_hash = Yii::$app->security->generatePasswordHash($password);
        } else {
            Yii::$app->response->setStatusCode(422);
            return $this->modelErrorsTo422Response([], 'Incorrect password items');
        }


        if ($user->validate()) {
            if ($user->save()) {
                return $user;
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return [$user->errors];
        }
        throw new ServerErrorHttpException();
    }

    public function actionUpdate($id)
    {
        $user = User::findOne($id);

        if (!$user) {
            throw new NotFoundHttpException();
        }

        $user->first_name = Yii::$app->request->post('first_name');
        $user->last_name = Yii::$app->request->post('last_name');
        $user->login = Yii::$app->request->post('login');
        $user->role = Yii::$app->request->post('role');
        $user->birth = Yii::$app->request->post('birth');
        $user->activated = Yii::$app->request->post('activated');
        $password = Yii::$app->request->post('password');
        $password_confirm = Yii::$app->request->post('password_confirm');

        if ($password === $password_confirm) {
            if (trim($password) !== '') {
                $user->password_hash = Yii::$app->security->generatePasswordHash($password);
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return $this->modelErrorsTo422Response([], 'Incorrect password items');
        }

        if ($user->validate()) {
            if ($user->save()) {
                return $user;
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return [$user->errors];
        }
        throw new ServerErrorHttpException();
    }

    public function actionViewProfile()
    {
        $token = Yii::$app->request->headers['Authorization'];
        if ($token && strpos($token, 'Bearer ') === 0) {
            $token = substr($token, 7);
            if ($user = User::findOne(['auth_token' => $token])) {
                return $user;
            }
        }
        // $identity = User::findIdentityByAccessToken();
        return $token;
    }

    public function actionUpdateProfile()
    {
        $user = null;
        $token = Yii::$app->request->headers['Authorization'];
        if ($token && strpos($token, 'Bearer ') === 0) {
            $token = substr($token, 7);
            $user = User::findOne(['auth_token' => $token]);
        }

        if (!$user) {
            throw new NotFoundHttpException();
        }

        $user->first_name = Yii::$app->request->post('first_name');
        $user->last_name = Yii::$app->request->post('last_name');
        $user->birth = Yii::$app->request->post('birth');
        $password = Yii::$app->request->post('password');
        $password_confirm = Yii::$app->request->post('password_confirm');

        if ($password === $password_confirm) {
            if (trim($password) !== '') {
                $user->password_hash = Yii::$app->security->generatePasswordHash($password);
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return $this->modelErrorsTo422Response([], 'Incorrect password items');
        }

        if ($user->validate()) {
            if ($user->save()) {
                return $user;
            }
        } else {
            Yii::$app->response->setStatusCode(422);
            return [$user->errors];
        }
        throw new ServerErrorHttpException();
    }
}
