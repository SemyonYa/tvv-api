<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ctor_item".
 *
 * @property int $id
 * @property string $type
 * @property string $value
 * @property int $ctor_id
 * @property int $ordering
 *
 * @property Ctor $ctor
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
            [['type', 'value', 'ctor_id', 'ordering'], 'required'],
            [['value'], 'string'],
            [['ctor_id', 'ordering'], 'integer'],
            [['type'], 'string', 'max' => 50],
            [['ctor_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ctor::className(), 'targetAttribute' => ['ctor_id' => 'id']],
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
            'ctor_id' => 'Ctor ID',
            'ordering' => 'Ordering',
        ];
    }

    /**
     * Gets query for [[Ctor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCtor()
    {
        return $this->hasOne(Ctor::className(), ['id' => 'ctor_id']);
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
