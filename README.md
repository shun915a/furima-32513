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

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| info                       | text       | null: false                    |
| price                      | integer    | null: false                    |
| category_id                | references | null: false, foreign_key: true |
| sales_status_id            | references | null: false, foreign_key: true |
| shipping_fee_status_id     | references | null: false, foreign_key: true |
| prefecture_id              | references | null: false, foreign_key: true |
| item_scheduled_delivery_id | references | null: false, foreign_key: true |

## items association

- belongs_to :user
- has_many :comments
- has_one :category
- has_one :sales_status
- has_one :shipping_fee_status
- has_one :prefecture
- has_one :item_scheduled_delivery

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

## comments association

- belongs_to :user
- belongs_to :item

## orders table

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| buyer_id  | references | null: false, foreign_key: true |
| seller_id | references | null: false, foreign_key: true |

## orders association

- has_one :item
- has_one :user

## addresses table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order_id      | references | null: false, foreign_key: true |
| zip_code      | integer    | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     | null: false                    |
| phone_number  | integer    | null: false                    |

## addresses association

- has_one :order
- belongs_to :prefecture
