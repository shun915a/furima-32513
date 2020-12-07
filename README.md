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

- has_many :items, through: :orders
- has_many :comments

## items table

| Column                     | Type    | Options                        |
| -------------------------- | ------- | ------------------------------ |
| name                       | string  | null: false                    |
| info                       | text    | null: false                    |
| price                      | integer | null: false                    |
| category_id                | integer | null: false, foreign_key: true |
| sales_status_id            | integer | null: false, foreign_key: true |
| shipping_fee_status_id     | integer | null: false, foreign_key: true |
| prefecture_id              | integer | null: false, foreign_key: true |
| item_scheduled_delivery_id | integer | null: false, foreign_key: true |

## items association

- belongs_to :user
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

## addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| zip_code      | integer    | null: false, foreign_key: true |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

## addresses association

- has_one :order
