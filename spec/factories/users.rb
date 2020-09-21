FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name                   { '山田' }
    first_name                  { '侑矢' }
    last_name_kana              { 'ヤマダ' }
    first_name_kana             { 'ユウヤ' }
    birth_date                  { '1990-12-31' }
  end
end
