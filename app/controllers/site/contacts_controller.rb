class Site::ContactsController < Site::ApplicationController
  protect_from_forgery with: :null_session

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.msg(@contact).deliver
      redirect_to contacts_path, notice: 'Sua mensagem foi enviada com sucesso.'
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
