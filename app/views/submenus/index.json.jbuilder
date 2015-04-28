json.array!(@submenus) do |submenu|
  json.extract! submenu, :id, :name, :route, :active, :menu_id, :created_by, :updated_by, :deactivated_by
  json.url submenu_url(submenu, format: :json)
end
