class Site::CartsController < Site::ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  before_action :authenticate_user!, only: [:index]

  def index
    @carts = Cart.where(created_by: current_user.id)
    respond_with(@carts)
  end

  def index_count
    if user_signed_in?
      @carts = Cart.where(created_by: current_user.id).count
      render json: { message: @carts }
    end
  end

  def new
    @cart = Cart.new
    respond_with(@cart)
  end

  def create
    @cart = Cart.new(cart_params)
    @carts = Cart.where(created_by: current_user.id)

    aux = 0

    @carts.each do |cart|
      if cart.product_id === @cart.product_id
        aux = 1
        break
      else
        aux = 0
      end
    end

    if aux == 0
      if @cart.save
        render json: { message: "Produto adicionado ao seu carrinho com sucesso." }
      else
        render json: { message: "Não foi possível adicionar este produto o carrinho. Tente novamente." }
      end
    else
      render json: { message: "Você já possui este produto em seu carrinho." }
    end
  end

  def update
    @cart.update(cart_params)
    redirect_to carts_path
  end

  def destroy
    @cart.destroy
    respond_with(@cart)
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:quantity, :product_id, :created_by, :updated_by)
  end
end
