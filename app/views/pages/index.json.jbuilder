json.array!(@pages) do |page|
  json.extract! page, :id, :title, :description, :active, :created_by, :updated_by, :deactivated_by
  json.url page_url(page, format: :json)
end
