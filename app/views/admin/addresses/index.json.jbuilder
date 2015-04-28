json.array!(@addresses) do |address|
  json.extract! address, :id, :field1, :field2, :field3, :field4, :city, :state, :postalcode, :user_id, :created_by, :updated_by, :deactivated_by
  json.url address_url(address, format: :json)
end
