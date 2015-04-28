json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :name, :description, :active, :category_id, :created_by, :updated_by, :deactivated_by
  json.url subcategory_url(subcategory, format: :json)
end
