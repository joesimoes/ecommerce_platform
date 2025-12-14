class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @order = Order.new(customer_id: order_params[:customer_id], shipping_address: order_params[:shipping_address]) 

    order_params[:products].each do |product|
      @order.order_products.build(
        product_id: product[:product_id],
        quantity: product[:quantity] || 1,
        price_cents: product[:price_cents]
      )
    end

    unless process_payment(payment_params) 
      render json: { message: payment_result.message, error: payment_result.error, status: payment_result.status }
      return
    end

    warehouse = Warehouse.select_for(@order)

    if @order.place!(warehouse: warehouse)
      render json: { message: "Order successfully created."}, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :warehouse_id, :shipping_address, products: [:product_id, :quantity, :price_cents])
  end

  def payment_params
    params.require(:payment).permit(:card_number, :amount_cents, :description)
  end

  def process_payment(payment_params)
    PaymentProcessor.call(payment_params)
  end
end

