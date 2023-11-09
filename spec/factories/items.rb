FactoryBot.define do
  factory :item do
    title { 'Sample Item' }
    info { 'Sample description' }
    tag_id { 2 }
    condition_id { 2 }
    invoice_option_id { 2 }
    prefecture_id { 2 }
    invoice_day_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end