class Order < ApplicationRecord
  include AASM

  belongs_to :customer
  belongs_to :warehouse
  has_many :order_products
  has_many :products, through: :order_products

  aasm do
    state :placed, initial: true
    state :shipped
    state :delivered
    state :failed
  end

  def fulfillable_warehouses
    Warehouse.fulfillable_for(self)
  end

  def best_warehouse
    fulfillable_warehouses
      .sort_by { |warehouse| warehouse.distance_to(shipping_address) }
      .first
  end

  def total_amount_cents
    order_products.sum(&:price_cents)
  end

  def place!(warehouse:)
    raise ArgumentError, "Warehouse is required to place an order" if warehouse.nil?

    transaction do
      self.warehouse = warehouse
      order_products.each do |op|
        wp = warehouse.warehouse_products.lock.find_by!(product_id: op.product_id)
        wp.decrement!(op.quantity)
      end

      update!(aasm_state: :placed) 
    end
  end
end
