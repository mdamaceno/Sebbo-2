class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @product_orders = ProductOrder.all
    respond_with(@product_orders)
  end

  def show
    respond_with(@product_order)
  end

  def new
    @product_order = ProductOrder.new
    respond_with(@product_order)
  end

  def edit
  end

  def create
    @product_order = ProductOrder.new(product_order_params)
    @product_order.save
    respond_with(@product_order)
  end

  def update
    @product_order.update(product_order_params)
    respond_with(@product_order)
  end

  def destroy
    @product_order.destroy
    respond_with(@product_order)
  end

  private
    def set_product_order
      @product_order = ProductOrder.find(params[:id])
    end

    def product_order_params
      params.require(:product_order).permit(:name, :price, :description, :quantity, :order_id)
    end
end
