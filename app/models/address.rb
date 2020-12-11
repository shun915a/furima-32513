class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\d/, message: 'input only number' }
  end
end
