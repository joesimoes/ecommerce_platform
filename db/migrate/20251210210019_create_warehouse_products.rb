class CreateWarehouseProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :warehouse_products do |t|
      t.integer :warehouse_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
