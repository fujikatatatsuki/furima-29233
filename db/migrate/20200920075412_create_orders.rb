class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :shipping_region_id, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :shopping, foreign_key: true
      t.timestamps
    end
  end
end
