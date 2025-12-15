class Warehouse < ApplicationRecord
  has_many :orders
  has_many :warehouse_products
  has_many :products, through: :warehouse_products

  def self.select_for(order)
    warehouses = Warehouse.includes(:warehouse_products)

    fulfilling_warehouses = warehouses.select do |warehouse|
      warehouse.fulfillable_for?(order)
    end

    fulfilling_warehouses.min_by { |fw| fw.distance_to(order.shipping_address) }
  end

  def fulfillable_for?(order)
    order.order_products.all? do |op|
      potential_warehouse = warehouse_products.find { |wp| wp.product_id == op.product_id }
      potential_warehouse && potential_warehouse.quantity >= op.quantity
    end
  end

  def distance_to(address)
      # fake coordinates, find closest warehouse based on lat/long of address compared to shipping address of order
    latitude = rand(-90.0..90.0)
    longitude = rand(-180.0..180.0)

    lat, lon = FakeGeocoder.coordinates_for(address)
    (latitude - lat).abs + (longitude - lon).abs
  end
end
