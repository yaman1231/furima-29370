FactoryBot.define do
  factory :purchase_address do
    user_id { 1 }
    item_id { 1 }
    token { 'test' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '01203334444' }
  end
end
