## usersテーブル

|Column|Type|Options|
|:------|:----|:-------|
|name|text|null: false, index: true
|email|text|null: false, unique: true

### Association
- has_many :message
- has_many :members
- has_many :group, through :members


## groupテーブル

|Column|Type|Options|
|:------|:----|:-------|
|name|string|null: false, index: true

### Association
- has_many :messages
- has_many :users, through: members
- has_many :members


## messageテーブル

Column|Type|Options|
|:------|:----|:-------|
|body|text|null: false,
|image|string|null: false
|user_id|references|null: false, foreign_key: true
|group_id|references|null: false, foreign_key: true

### Association
- belongs_to :user
- belongs_to :group


## membersテーブル

|Column|Type|Options|
|:------|----:|:-------:|
|user_id|references|null: false, foreign_key: true
|group_id|references|null: false, foreign_key: true

### Association
- has_many :messages
- has_many :members
_ has_many :groups, through: members
