class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :warehouse_products
  has_many :warehouses, through: :warehouse_products
end
