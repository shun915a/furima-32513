class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :name
    validates :info
    validates :price,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9_999_999,
                message: 'out of setting range or not integer'
              }
    validates :image
  end

  with_options numericality: { other_than: 0 }
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :item_scheduled_delivery_id
end
