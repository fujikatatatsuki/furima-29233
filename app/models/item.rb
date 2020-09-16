class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  # 共通で、空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :selling_price
  end

  # 共通で、選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_region_id
    validates :shipping_day_id
  end

  # 販売価格の範囲が、¥300以上~¥9,999,999未満であること
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # 販売価格は半角数字のみ入力可能
  VALID_DELIVERY_FEE_REGEX = /[0-9\d]/.freeze
  validates :selling_price, format: { with: VALID_DELIVERY_FEE_REGEX }
end
