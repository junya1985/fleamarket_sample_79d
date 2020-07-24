# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null:false, unique: true|
|password|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_date|string|null: false|
|icon|string||

### Association
- has_many :items dependent: :destroy
- has_one :address  dependent: :destroy
- has_many :comments  dependent: :destroy
- has_many :favorites dependent: :destroy
- has_one :card dependent: :destroy

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|tel|string||

### Association
- belongs_to :user


## SNS_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|string|null: false|
|condition(enum)|integer|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|shipping_cost|boolean|null: false|
|prefecture_id|integer|null: false|
|shipping_day|string|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key :true|
|size|string||

### Association
- belongs_to :user
- belongs_to :category
- has_many :images dependent: :destroy


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|content|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestory|string||

### Association
- has_many :items


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique :true|

### Association
- has_many :items

