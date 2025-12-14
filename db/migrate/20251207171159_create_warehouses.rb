class CreateWarehouses < ActiveRecord::Migration[8.1]
  def change
    create_table :warehouses do |t|
      t.string :address

      t.timestamps
    end
  end
end
