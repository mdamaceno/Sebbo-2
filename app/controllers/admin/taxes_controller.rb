class Admin::TaxesController < Admin::ApplicationController

  before_action :set_tax, only: [:edit, :update, :destroy]

  def index
    @taxes = Tax.all
  end

  def new
    @tax = Tax.new
  end

  def edit
  end

  def create
    @tax = Tax.new(tax_params)
    respond_to do |format|
      if @tax.save
        format.html { redirect_to admin_taxes_path, notice: 'Imposto registrado com sucesso.' }
      else
        format.html { redirect_to admin_taxes_path, notice: 'Não registrado. Tente novamente.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @tax.update(tax_params)
        format.html { redirect_to admin_edit_tax_path(@tax), notice: 'Imposto atualizado com sucesso.' }
      else
        format.html { redirect_to admin_edit_tax_path(@tax), notice: 'Não atualizado. Tente novamente.' }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @tax.destroy
        format.html { redirect_to admin_taxes_path, notice: 'Imposto removido com sucesso.' }
      else
        format.html { redirect_to admin_taxes_path, notice: 'Não removido. Tente novamente.' }
      end
    end
  end

  private

  def set_tax
    @tax ||= Tax.find(params[:id])
  end

  def tax_params
    params.require(:tax).permit(
      :name, :percentage
    )
  end
end
