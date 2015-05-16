class Site::ContactsController < Site::ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if ContactMailer.msg(@contact).deliver
      redirect_to contact_path, notice: 'Sua mensagem foi enviada com sucesso.'
    else
      redirect_to :index, notice: 'Não foi possível enviar sua mensagem. Tente novamente.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name, :email, :subject, :message
    )
  end
end
