# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
Customer.create(email: "test123@gmail.com", name: "Jonathan Dough", phone_number: "1231231234")
Product.create(name: "Office Chair", description: "Lorem Ipsum...", price_cents: 15000)
Product.create(name: "Stapler", description: "I believe you have my stapler...", price_cents: 15000)
Warehouse.create(address: "500 Smith Ave, Richmond, VA 55555")
Warehouse.create(address: "123 Atlantic Avenue, New York, NY 10010")
WarehouseProduct.create(warehouse_id: Warehouse.first.id, product_id: Product.first.id, quantity: 50)
WarehouseProduct.create(warehouse_id: Warehouse.first.id, product_id: Product.last.id, quantity: 50)
WarehouseProduct.create(warehouse_id: Warehouse.last.id, product_id: Product.last.id, quantity: 50)
