FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Commerce.product_name }
    info { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    sales_status_id { Faker::Number.between(from: 1, to: 5) }
    shipping_fee_status_id { Faker::Number.between(from: 1, to: 3) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    item_scheduled_delivery_id { Faker::Number.between(from: 1, to: 3) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
