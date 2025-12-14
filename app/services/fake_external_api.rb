class FakeExternalApi
  def self.create_payment(card_number:, amount_cents:, description:)
    true
  end
end
