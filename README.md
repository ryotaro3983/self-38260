# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | string |                           |

### Association

- has_many :posts
- has_many :contents
- has_many :reviews


## posts テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one_attached :image


## contents テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| genre    | string     | null: false                    |
| memo     | string     |                                |
| user     | references | null: false, foreign_key: true |

### Association

- has_many :reviews
- has_one_attached :image
- belongs_to :user


## reviews テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| content  | references | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :content