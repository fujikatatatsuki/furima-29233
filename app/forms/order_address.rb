class OrderAddress
  include ActiveModel::Model
  attr_accessor :shipping_region_id, :postal_code, :city, :block_number, :building_name, :phone_number, :token, :item_id, :user_id
    # 共通で、空の投稿を保存できないようにする
    with_options presence: true do
      validates :token
      # 郵便番号には-が必要
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'input correctly' }

      validates :city
      validates :block_number
      # 電話番号には-が不要で、11桁以内であること
      validates :phone_number, format: { with: /\A\d{11}\z/ }
    end

    # 共通で、選択が「---」の時は保存できないようにする
    with_options numericality: { other_than: 1 } do
      validates :shipping_region_id
    end

    def save
      # orderの値を保存
      order = Order.create!(user_id: user_id, item_id: item_id)

      # addressの情報を保存
      Address.create!(shipping_region_id: shipping_region_id, postal_code: postal_code, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end