## usersテーブル
|Column|Type|Options|
|:------|----:|:-------:|
|name|text|null: false, index: true
|email|text|null: false, unique: true

### Association
- has_many :messages
- has_many :members
_ has_many :groups, through: members

##messageテーブル
|Column|Type|Options|
|:------|----:|:-------:|
|body|text|null: false
|image|string|null: false
|user_id|integer|nill :false, forgin_kye: true

### Association
- belongs_to :user
- belongs_to :group

## groupテーブル
|Column|Type|Options|
|:------|----:|:-------:|
|group_name|text|null: false, index: true
|member_id|integer|null: false, foreign_key: true

###Association
- has_many :users, through: members
- has_many :messages
- has_many :members

## membersテーブル
|Column|Type|Options|
|:------|----:|:-------:|
|user_id|integer|null: false, foreign_key: true
|group_id|integer|null: false, foreign_key: true

### Association
- belongs_to :group
- belongs_to :user

