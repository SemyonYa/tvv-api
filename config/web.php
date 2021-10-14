<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'components' => [
        'request' => [
            'cookieValidationKey' => 'mMOxRAqcN2gUyBm2h90HDPYOvWDNhbq_',
            'baseUrl' => '',
            'parsers' => [
                'application/json' => 'yii\web\JsonParser',
                // 'multipart/form-data' => 'yii\web\MultipartFormDataParser'
            ]
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
            'enableSession' => false,
            'loginUrl' => null,
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => $db,
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['image', 'place'],
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['image'],
                    'extraPatterns' => [
                        'GET by-params' => 'index'
                        // 'POST <id>/children' => 'children',
                        // 'OPTIONS <id>/children' => 'options'
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['place'],
                    'extraPatterns' => [
                        'GET <region>' => 'index',
                        'POST <id>/children' => 'children',
                        'OPTIONS <id>/children' => 'options'
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['project'],
                    'extraPatterns' => [
                        'POST <id>/children' => 'children',
                        'OPTIONS <id>/children' => 'options'
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['ctor'],
                    'extraPatterns' => [
                        'GET tag/<tag>/<region>' => 'by-tag',
                        'GET tag/<tag>' => 'by-tag',
                        'OPTIONS tag/<tag>/<region>' => 'options',
                        'OPTIONS tag/<tag>' => 'options',
                        'POST <id>/children' => 'children',
                        'OPTIONS <id>/children' => 'options'
                    ]
                ],
                // TODO: 
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['public-data'],
                    'pluralize' => false,
                    'extraPatterns' => [
                        'GET places/<region>' => 'places',
                        'GET place/<id>' => 'place',
                        'GET project/<id>' => 'project',
                        // 'GET about' => 'about',
                        // 'GET personal' => 'personal',
                        // 'GET positions' => 'positions',
                        // 'GET galery' => 'galery',
                        // 'GET services/<region>' => 'services',
                        // 'GET programs' => 'programs',
                        // 'GET articles' => 'articles',
                        // 'GET article/<id>' => 'article',
                        // 'HEAD <action>' => 'head',
                        // 'OPTIONS <action>' => 'options',
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['user'],
                    'extraPatterns' => [
                        'GET profile' => 'view-profile',
                        'OPTIONS profile' => 'options',
                        'PUT profile' => 'update-profile'
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule',
                    'controller' => ['auth'],
                    'pluralize' => false,
                    // 'patterns' => [
                    //     'POST' => 'create',
                    //     'DELETE' => 'logout'
                    // ]
                ],
            ],
        ],
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
}

return $config;
