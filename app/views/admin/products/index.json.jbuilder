json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :cover, :description, :stock, :active, :category_id, :subcategory_id, :user_id, :created_by, :updated_by, :deactivated_by
  json.url product_url(product, format: :json)
end
