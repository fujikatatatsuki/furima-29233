class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region
end
