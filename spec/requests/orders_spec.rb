require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /admin/pedidos" do
    it "Deve retornar status 200 da página de pedido" do
      get admin_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
