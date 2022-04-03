FactoryBot.define do
  factory :address do
    post_code            {'123-1234'}
    municipalities       {'テスト市'}
    location_id          {'1'}
    address              {'テスト番地'}
    building             {'テストビル'}
    tel_number           {'09011111111'}
    association :order
  end
end
