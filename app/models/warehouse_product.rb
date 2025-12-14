class WarehouseProduct < ApplicationRecord
  belongs_to :warehouse
  belongs_to :product

  class InsufficientInventory < StandardError; end

  def decrement!(amount)
    raise ArgumentError if amount <= 0
    raise InsufficientInventory if quantity < amount

    update!(quantity: quantity - amount)
  end
end
