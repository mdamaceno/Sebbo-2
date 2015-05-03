class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'application_admin'

  before_action :authenticate_user!

  helper_method :menus

  def menus
    Menu.all
  end

  protected

  def check_permission
    unless current_user.group == 'Administrador'
      respond_to do |format|
        format.html {
          redirect_to root_url,
          notice: 'Você não tem permissão de acesso a essa página'
        }
      end
    end
  end
end
