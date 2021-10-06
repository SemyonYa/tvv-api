<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ctor".
 *
 * @property int $id
 * @property string $title
 * @property string|null $subtitle
 * @property string|null $description
 * @property string $created_at
 * @property string|null $author_name
 * @property int $author_id
 * @property int|null $thumb_id
 * @property string|null $tag
 * @property int $is_active
 * @property int $price
 * @property string|null $region
 *
 * @property User $author
 * @property CtorItem[] $ctorItems
 */
class Ctor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ctor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'created_at', 'author_id'], 'required'],
            [['title', 'subtitle', 'description', 'region'], 'string'],
            [['created_at'], 'safe'],
            [['author_id', 'thumb_id', 'is_active', 'price'], 'integer'],
            [['author_name'], 'string', 'max' => 200],
            [['tag'], 'string', 'max' => 50],
            [['author_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['author_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'subtitle' => 'Subtitle',
            'description' => 'Description',
            'created_at' => 'Created At',
            'author_name' => 'Author Name',
            'author_id' => 'Author ID',
            'thumb_id' => 'Thumb ID',
            'tag' => 'Tag',
            'is_active' => 'Is Active',
            'price' => 'Price',
            'region' => 'Region',
        ];
    }

    /**
     * Gets query for [[Author]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'author_id']);
    }

    /**
     * Gets query for [[CtorItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCtorItems()
    {
        return $this->hasMany(CtorItem::className(), ['ctor_id' => 'id']);
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

    public function fields()
    {
        return array_merge(parent::fields(), ['ctorItems', 'thumb']);
    }
}
