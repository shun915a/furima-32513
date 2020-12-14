class OrderItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :zip_code, :prefecture_id, :city, :street, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\d/, message: 'input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(
      order_id: order.id,
      zip_code: zip_code,
      prefecture_id: prefecture_id,
      city: city,
      street: street,
      building: building,
      phone_number: phone_number
    )
  end
end
