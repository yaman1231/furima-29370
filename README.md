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

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| user            | references | null:false, foreign_key:true |
| name            | string     | null: false                  |
| description     | text       | null: false                  |
| category        | integer    | null: false                  |
| condition       | integer    | null: false                  |
| postage_payer   | integer    | null: false                  |
| prefecture      | integer    | null: false                  |
| handling_time   | integer    | null: false                  |
| price           | integer    | null: false                  |

### Association

- belongs_to :user
- has_one :purchase


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