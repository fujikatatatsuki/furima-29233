class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to_active_hash :category
  belong_to_active_hash :status
  belong_to_active_hash :delivery_fee
  belong_to_active_hash :shipping_region
  belong_to_active_hash :shipping_day

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
