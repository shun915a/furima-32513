FactoryBot.define do
  factory :order_item do
    association :user
    association :item
    token { Faker::Number.number(digits: 16).to_s }
    zip_code { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
