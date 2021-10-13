<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ctor_item".
 *
 * @property int $id
 * @property string $type
 * @property string $value
 * @property int $parent_id
 * @property int $ordering
 */
class CtorItem extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ctor_item';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['type', 'value', 'parent_id', 'ordering'], 'required'],
            [['value'], 'string'],
            [['parent_id', 'ordering'], 'integer'],
            [['type'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'value' => 'Value',
            'parent_id' => 'Parent ID',
            'ordering' => 'Ordering',
        ];
    }

    /** 
     * Gets query for [[Ctor]]. 
     * 
     * @return \yii\db\ActiveQuery 
     */
    public function getParent()
    {
        if ($item = Place::findOne($this->parent_id)) {
            return $item;
        }
        if ($item = Project::findOne($this->parent_id)) {
            return $item;
        }
        return null;
    }

    public function getImage()
    {
        return $this->type === 'Image'
            ? Image::findOne($this->value)
            : null;
    }

    public function fields()
    {
        return array_merge(parent::fields(), ['image']);
    }
}
