class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :warehouse_id, null: false
      t.string :shipping_address, null: false
      t.string :aasm_state, null: false

      t.timestamps
    end
  end
end
