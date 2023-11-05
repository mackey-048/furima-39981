FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name { "苗字" }
    last_name { "名前" }
    first_name_kana { "ファーストネーム" }
    last_name_kana { "ラストネーム" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end