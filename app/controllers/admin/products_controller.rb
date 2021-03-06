class Admin::ProductsController < Admin::ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: "Criado com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { render :edit, notice: "Atualizado com sucesso." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :price, :cover, :description, :publishing_house, :author,
      :number_pages, :stock, :active, :category_id, :subcategory_id, :user_id,
      :created_by, :updated_by, :deactivated_by
    )
  end
end
