class Site::ProductsController < Site::ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :cover, :description, :stock, :active, :category_id, :subcategory_id, :user_id, :created_by, :updated_by, :deactivated_by)
    end
end
