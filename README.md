##テーブル設計

##usersテーブル 

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| first_name            | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| nickname              | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false,                   |
| birthday              | date       | null: false

##アソシエーション

has_many :items

has_many :purchases

##itemsテーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| condition_id| integer    | null: false                    |
| postage_id  | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| arrival_id  | integer    | null: false                    |
| item_name   | string     | null: false                    |
| price       | integer    | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_key: true | 

##アソシエーション

belong_to :purchase
belongs_to :user

##destinationsテーブル


| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| post_num | string     | null: false                    |
| region_id| integer    | null: false                    |
| city     | string     | null: false                    |
| address  | string     | null: false                    |
| building | string     | null: true                     |
| phone    | string     | null: false                    |
| purchase |references  | null: false, foreign_key       |

##アソシエーション

belongs_to :purchase

##purchasesテーブル


| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| user  | references  | null: false, foreign_key: true |
| item  | references  | null: false, foreign_key: true |

##アソシエーション

belongs_to :user
has_one :destination
belong_to :item


