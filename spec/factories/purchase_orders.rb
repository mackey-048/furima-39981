FactoryBot.define do
  factory :purchase_order do
    token {"tok_abcdefghijk00000000000000000"}
    postcode {'123-4567'}
    prefecture_id { 1 }
    city { '東京都'}
    block { '1-1'}
    building { '東京ハイツ'}
    phone_number { '09012345678'}
    
  end
end
