class Site::OrdersController < Site::ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    respond_with(@order)
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.save
    render json: { message: "Pedido registrado com sucesso." }
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:freight_price, :freight_type, :payment_method, :status, :delivery_field1, :delivery_field2, :delivery_field3, :delivery_field4, :delivery_city, :delivery_state, :user_id, :updated_by, :deactivated_by)
    end
end
