FactoryBot.define do
  factory :order_address do
    token              { "tok_51203ffb08c5b6c08847d42762a5" }
    postal_code        { "123-4567" }
    shipping_region_id { 47 }
    city               { "鹿児島市甲突町" }
    block_number       { "24-1" }
    phone_number       { "08001201171" }
  end
end

# # orderの値を保存
# order = Order.create!(user_id: user_id, item_id: item_id)

# # # addressの情報を保存
# Address.create!(shipping_region_id: shipping_region_id, postal_code: postal_code, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)


# "token"=>"tok_51203ffb08c5b6c08847d42762a5"