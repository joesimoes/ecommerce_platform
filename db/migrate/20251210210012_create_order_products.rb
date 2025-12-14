class CreateOrderProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :price_cents, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
