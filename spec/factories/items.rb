FactoryBot.define do
  factory :item do
    association :user
    image                 {Faker::Lorem.sentence}
    name                  {Faker::Lorem.sentence}
    price                 {"1000"}
    description           {Faker::Lorem.sentence}
    category_id           {2}
    condition_id          {2}
    postage_payer_id      {2}
    prefecture_id         {2}
    handling_time_id      {2}
   end
end