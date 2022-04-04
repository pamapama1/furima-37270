FactoryBot.define do
  factory :order_address do
    post_code            { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    municipalities       { Faker::Address.city}
    location_id          { Faker::Number.between(from: 1, to: 47) }
    address              { Faker::Address.city}
    building             { Faker::Address.city}
    tel_number           { Faker::Number.decimal_part(digits: 11)}
    item_id              { Faker::Number.non_zero_digit }
    user_id              { Faker::Number.non_zero_digit }
    token                { "tok_abcdefghijk00000000000000000"}
  end
end
