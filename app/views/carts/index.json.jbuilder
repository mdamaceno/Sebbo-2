json.array!(@carts) do |cart|
  json.extract! cart, :id, :quantity, :product_id, :created_by, :updated_by
  json.url cart_url(cart, format: :json)
end
