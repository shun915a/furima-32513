# table design

## users table

| Column          | Type   | options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| first_name_kana | string | null: false |
| last_name       | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

## users association

- has_many :items
- has_many :comments

## items table

| Column      | Type          | Options     |
| ----------- | ------------- | ----------- |
| name        | string        | null: false |
| info        | text          | null: false |
| price       | integer       | null: false |
| image       | ActiveStorage |             |
| sold_status | boolean       |             |

## items association

- belongs_to :users
- has_many :comments
- belongs_to :categories
- belongs_to :sales_statuses
- belongs_to :shipping_fee_statuses
- belongs_to :prefectures
- belongs_to :item_scheduled_deliveries

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## comments association

- belongs_to :users
- belongs_to :items

## categories table (active_hash)

| Column   | Type   | Options |
| -------- | ------ | ------- |
| category | string |         |

## categories association

- has_many :items

## sales_statuses table (active_hash)

| Column       | Type   | Options |
| ------------ | ------ | ------- |
| sales_status | string |         |

## sales_statuses association

- has_many :items

## shipping_fee_statuses (active_hash)

| Column              | Type   | Options |
| ------------------- | ------ | ------- |
| shipping_fee_status | string |         |

## shipping_fee_statuses association

- has_many :items

## prefectures table (active_hash)

| Column     | Type   | Options |
| ---------- | ------ | ------- |
| prefecture | string |         |

## prefectures association

- has_many :items

## item_scheduled_deliveries table (active_hash)

| Column                  | Type   | Options |
| ----------------------- | ------ | ------- |
| item_scheduled_delivery | string |         |

## item_scheduled_deliveries association

- has_many :items
