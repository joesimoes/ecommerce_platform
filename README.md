# README
Ruby on Rails application for placing orders based on warehouse product availability

## Database setup:
`bundle exec rails db:setup`

## Running the application:
`bundle exec rails s`

## Example POST request to /orders:
`localhost:3000/orders`

```
{ "order": {
    "customer_id": 1,
    "shipping_address": "123 Smith Street, New York, NY 10010",
    "products": [{ "product_id": 1, "quantity": 1 }, { "product_id": 2, "quantity": 1 }]
    },
  "payment": {
    "card_number": "1234123412341234",
    "amount_cents": 10000,
    "description": "Payment for order"
  }
}
```
