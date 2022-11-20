# テーブル設計

## usersテーブル

|Column              |Type       |Options                    |
|--------------------|-----------|---------------------------|
|nickname            |string     |null: false, unique: true  |
|email               |string     |null: false, unique: true  |
|encrypted_password  |string     |null: false                |

### Association
- has_many :catches
- has_many :comments
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
- has_many :following_user, through: :follower, source: :followed
- has_many :follower_user, through: :followed, source: :follower
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

## catchesテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|aria           |integer    |null: false                    |
|detail_area    |string     |                               |
|fish_type      |string     |                               |
|fish_catch     |string     |                               |
|date and time  |string     |                               |
|comment        |text       |                               |
|user           |references |null: false, foreign_key:true  |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|Column   |Type        |Options                        |
|---------|------------|-------------------------------|
|comment  |string      |null: false                    |
|user     |references  |null: false, foreign_key:true  |
|catch    |references  |null: false, foreign_key:true  |

### Association
- belongs_to :catch
- belongs_to :user

## relationshipsテーブル

|Column    |Type        |Options                        |
|----------|------------|-------------------------------|
|follower  |references  |null: false, foreign_key:true  |
|followed  |references  |null: false, foreign_key:true  |

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## room_usersテーブル

|Column  |Type        |Options                        |
|--------|------------|-------------------------------|
|user    |references  |null: false, foreign_key:true  |
|room    |references  |null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :room

## roomsテーブル

|Column  |Type        |Options                        |
|--------|------------|-------------------------------|
|user    |references  |null: false, foreign_key:true  |

### Association
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy

## messagesテーブル

|Column   |Type        |Options                        |
|---------|------------|-------------------------------|
|user     |references  |null: false, foreign_key:true  |
|room     |references  |null: false, foreign_key:true  |
|message  |text        |null: false                    |

### Association
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy