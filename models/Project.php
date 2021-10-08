<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "project".
 *
 * @property int $id
 * @property string $name
 * @property string|null $period
 * @property int $costs
 * @property string $people
 * @property string $type
 * @property int|null $thumb_id
 * @property int|null $place_id
 * @property int $is_active
 *
 * @property Place $place
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'project';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'people', 'type'], 'required'],
            [['name', 'type'], 'string'],
            [['costs', 'thumb_id', 'place_id', 'is_active'], 'integer'],
            [['period', 'people'], 'string', 'max' => 50],
            [['place_id'], 'exist', 'skipOnError' => true, 'targetClass' => Place::className(), 'targetAttribute' => ['place_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'period' => 'Period',
            'costs' => 'Costs',
            'people' => 'People',
            'type' => 'Type',
            'thumb_id' => 'Thumb ID',
            'place_id' => 'Place ID',
            'is_active' => 'Is Active',
        ];
    }

    /**
     * Gets query for [[Place]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPlace()
    {
        return $this->hasOne(Place::className(), ['id' => 'place_id']);
    }
}
