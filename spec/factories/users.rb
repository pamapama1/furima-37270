FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'aaaaaa1'}
    password_confirmation {password}
    first_name            {'テスト'}
    second_name           {'太郎'}
    first_name_kana       {'テスト'}
    second_name_kana      {'テスト'}
    birthday             {'1990-1-1'}

  end
end