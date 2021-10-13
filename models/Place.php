<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "place".
 *
 * @property int $id
 * @property string $name
 * @property int|null $thumb_id
 * @property int $is_active
 * @property string $region
 * @property float|null $x
 * @property float|null $y
 *
 * @property Project[] $projects
 */
class Place extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'place';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'region'], 'required'],
            [['name', 'region'], 'string'],
            [['thumb_id', 'is_active'], 'integer'],
            [['x', 'y'], 'number'],
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
            'thumb_id' => 'Thumb ID',
            'is_active' => 'Is Active',
            'region' => 'Region',
            'x' => 'X',
            'y' => 'Y',
        ];
    }

    /**
     * Gets query for [[CtorItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(CtorItem::className(), ['parent_id' => 'id']);
    }

    /**
     * Gets query for [[Thumb]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getThumb()
    {
        return $this->hasOne(Image::className(), ['id' => 'thumb_id']);
    }

    /**
     * Gets query for [[Projects]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProjects()
    {
        return $this->hasMany(Project::className(), ['place_id' => 'id']);
    }

    public function fields()
    {
        return array_merge(parent::fields(), ['items', 'projects', 'thumb']);
    }
}
