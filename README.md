##テーブル設計

##usersテーブル 

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| nickname | string     | null: false                    |
| email    | string     | null: false                    |
| password | string     | null: false, unique: true      |
| birthday | string     | null: false

##アソシエーション

has_many :items
has_many :comments
has_many :destinations
has_many :purchase

##itemsテーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| category | string     | null: false                    |
| condition| string     | null: false                    |
| postage  | string     | null: false                    |
| area     | string     | null: false                    |
| arrival  | string     | null: false                    |
| item_name| string     | null: false                    |
| price    | integer    | null: false                    |
| image    | string     | null: false                    |
| explanation | text    | null: false                    |
| user_id  | presences  | null: false, foreign_key: true | 

##アソシエーション

has_many :comments
belongs_to :users

##destinationテーブル


| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| post_num | integer    | null: false                    |
| region   | string     | null: false                    |
| city     | string     | null: false                    |
| address  | string     | null: false                    |
| phone    | integer    | null: false                    |


##アソシエーション

belongs_to :purchases
belongs_to :users

##purchaseテーブル


| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user_id  | presences  | null: false, foreign_key: true |
| item_id  | presences  | null: false, foreign_key: true |

##アソシエーション

belongs_to :items
has_one :destinations

##commentsテーブル


| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| text     | text       |                                |
| user_id  | presences  | null: false, foreign_key: true |
| item_id  | presences  | null: false, foreign_key: true |


##アソシエーション

belongs_to :users
belongs_to :items
