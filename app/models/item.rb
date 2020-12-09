class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :name
    validates :info
    validates :price,
              numericality: {
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9_999_999,
                message: 'Price Out of setting range'
              }
    validates :image
  end

  validates :category_id, numericality: { other_than: 0 }
  validates :sales_status_id, numericality: { other_than: 0 }
  validates :shipping_fee_status_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :item_scheduled_delivery_id, numericality: { other_than: 0 }
end
