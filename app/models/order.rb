class Order < ApplicationRecord
  belongs_to :shopping

  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to_active_hash :shipping_region
end
