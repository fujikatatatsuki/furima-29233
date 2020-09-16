FactoryBot.define do
  factory :item do
    name               { '商品名' }
    explanation        { '商品の説明' }
    category_id        { 2 }
    status_id          { 2 }
    delivery_fee_id    { 2 }
    shipping_region_id { 2 }
    shipping_day_id    { 2 }
    selling_price      { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
