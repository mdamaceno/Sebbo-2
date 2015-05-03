class Site::UsersController < Site::ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:index]

  def edit
    @user.addresses.build
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(current_user), notice: 'Usuário atualizado com sucesso.' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :firstname, :lastname, :phone1, :phone2, :doc1, :doc2,
      addresses_attributes: Address.attribute_names.collect { |att| att.to_sym }
    )
  end
end
