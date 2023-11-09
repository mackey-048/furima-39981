FactoryBot.define do
  factory :item do
    title { 'Sample Item' }
    info { 'Sample description' }
    tag_id { 1 }
    condition_id { 1 }
    invoice_option_id { 1 }
    prefecture_id { 1 }
    invoice_day_id { 1 }
    price { 1000 }
  end
end