json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :icon, :active, :created_by, :updated_by, :deactivated_by
  json.url menu_url(menu, format: :json)
end
