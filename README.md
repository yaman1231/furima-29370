# テーブル設計

## users テーブル

| Column          | Type   | Options                      |
| --------------- | ------ | ---------------------------- |
| nickname        | string | null: false                  |
| email           | string | null: false, uniqueness:true |
| password        | string | null: false, uniqueness:true |
| last_name       | string | null: false                  |
| first_name      | string | null: false                  |
| last_name_kana  | string | null: false                  |
| first_name_kana | string | null: false                  |
| birth_date      | date   | null: false                  |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user             | references | null:false, foreign_key:true |
| name             | string     | null: false                  |
| description      | text       | null: false                  |
| category_id      | integer    | null: false                  |
| condition_id     | integer    | null: false                  |
| postage_payer_id | integer    | null: false                  |
| prefecture_id    | integer    | null: false                  |
| handling_time_id | integer    | null: false                  |
| price            | integer    | null: false                  |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :handling_time


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresse


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, uniqueness:true   |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


## ER図

