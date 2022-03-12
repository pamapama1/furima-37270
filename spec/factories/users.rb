FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaaaaa1'}
    password_confirmation {password}
    first_name            {'テスト'}
    second_name           {'太郎'}
    first_name_kana       {'テスト'}
    second_name_kana      {'テスト'}
    birthday             {'1990-1-1'}

  end
end