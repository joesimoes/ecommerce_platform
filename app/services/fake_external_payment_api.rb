class FakeExternalPaymentApi
  def self.create_payment(card_number:, amount_cents:, description:)
    raise ArgumentError if [card_number, amount_cents, description].any?(&:nil?)

    true
  end
end
