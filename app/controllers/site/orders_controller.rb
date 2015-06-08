class Site::OrdersController < Site::ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!
  respond_to :html, :json

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf
    end
  end

  def nfe
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.save

    Cart.destroy_all(user_id: current_user.id)
    render json: { message: "Pedido registrado com sucesso.", id: @order.id }
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  def verification

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :freight_price, :freight_type, :payment_method, :status, :delivery_field1,
      :delivery_field2, :delivery_field3, :delivery_field4, :delivery_city,
      :delivery_state, :user_id, :updated_by, :deactivated_by
    )
  end
end
