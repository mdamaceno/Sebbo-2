class SubmenusController < ApplicationController
  before_action :set_submenu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @submenus = Submenu.all
    respond_with(@submenus)
  end

  def show
    respond_with(@submenu)
  end

  def new
    @submenu = Submenu.new
    respond_with(@submenu)
  end

  def edit
  end

  def create
    @submenu = Submenu.new(submenu_params)
    @submenu.save
    respond_with(@submenu)
  end

  def update
    @submenu.update(submenu_params)
    respond_with(@submenu)
  end

  def destroy
    @submenu.destroy
    respond_with(@submenu)
  end

  private
    def set_submenu
      @submenu = Submenu.find(params[:id])
    end

    def submenu_params
      params.require(:submenu).permit(:name, :route, :active, :menu_id, :created_by, :updated_by, :deactivated_by)
    end
end
