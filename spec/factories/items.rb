FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    category_id           { '1' }
    status_id             { '1' }
    delivery_charge_id    { '1' }
    location_id           { '1' }
    delivery_date_id      { '1' }
    description           { 'テスト' }
    price                 { '5000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-header02.png'), filename: 'furima-header02.png')
    end
  end
end
