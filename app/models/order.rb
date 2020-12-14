class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
  end
end
