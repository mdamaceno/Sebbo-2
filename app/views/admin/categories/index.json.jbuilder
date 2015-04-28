json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :active, :created_by, :updated_by, :deactivated_by
  json.url category_url(category, format: :json)
end
