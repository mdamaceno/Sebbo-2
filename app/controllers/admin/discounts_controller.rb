class Admin::DiscountsController < Admin::ApplicationController
  def index
    @discounts = Discount.all
  end

  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    respond_to do |format|
      if @discount.save
        format.html { redirect_to admin_discounts_path, notice: "Criado com sucesso." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_discount

  end

  def discount_params
    params.require(:discount).permit(:code, :value, :type_d)
  end
end
