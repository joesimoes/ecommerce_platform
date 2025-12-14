class PaymentProcessor
  def self.call(payment_params)
    successful_response = FakeExternalApi.create_payment(
      card_number: payment_params[:card_number],
      amount_cents: payment_params[:amount_cents],
      description: payment_params[:description]
    )

    successful_response ? true : false
  end
end
