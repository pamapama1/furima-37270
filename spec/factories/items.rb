FactoryBot.define do
  factory :item do
  #  item                  {}
    id                    {"1"}
    name                  {Faker::Name.initials(number:2)}
    category_id           {"1"}
    status_id             {"1"}
    delivery_charge_id    {"1"}
    location_id           {'1'}
    delivery_date_id      {'1'}
    description           {'テスト'}
    price                 {'5000'}
    user_id               {'1'}
     
  end
end
