# table design

## users table

| Column             | Type   | options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

## users association

- has_many :items
- has_many :orders
- has_many :comments

## items table

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: ture |
| name                       | string     | null: false                    |
| info                       | text       | null: false                    |
| price                      | integer    | null: false                    |
| category_id                | integer    | null: false                    |
| sales_status_id            | integer    | null: false                    |
| shipping_fee_status_id     | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| item_scheduled_delivery_id | integer    | null: false                    |

## items association

- belongs_to :user
- has_one :order
- has_many :comments

## comments table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## comments association

- belongs_to :user
- belongs_to :item

## orders table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## orders association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

## addresses association

- belongs_to :order
