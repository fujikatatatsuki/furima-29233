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
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_region
    validates :shipping_day
  end

  # 共通で、選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
    validates :category
    validates :status
    validates :delivery_fee
    validates :shipping_region
    validates :shipping_day
  end
end
