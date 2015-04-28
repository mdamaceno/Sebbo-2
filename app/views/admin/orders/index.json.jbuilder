json.array!(@orders) do |order|
  json.extract! order, :id, :freight_price, :freight_type, :payment_method, :status, :delivery_field1, :delivery_field2, :delivery_field3, :delivery_field4, :delivery_city, :delivery_state, :created_by, :updated_by, :deactivated_by
  json.url order_url(order, format: :json)
end
