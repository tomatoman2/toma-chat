# README
# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique:true|
|password|string|null: false|

### Association
- has_many :messages
- has_many :comments

## categoriy テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :messages

## massages テーブル
|Column|Type|Options|
|------|----|-------|
|text|string|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|message_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :comments

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|

### Association
- belongs_to :user
- belongs_to :message