class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price_cents, null: false
      t.string :description

      t.timestamps
    end
  end
end
