class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region

  # 共通で、空の投稿を保存できないようにする
  with_options presence: true do
    # 郵便番号には-が必要
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }

    validates :city
    validates :block_number

    # 電話番号には-が不要で、11桁以内であること
    validates :phone_number, format: { with: /\d{,11}/ }
  end

  # 共通で、選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :shipping_region_id
  end

end