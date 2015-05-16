class ContactMailer < ApplicationMailer
  def msg(contact)
    @name    = contact.name
    @email   = contact.email
    @subject = contact.subject
    @message = contact.message
    mail(
      from: @email,
      subject: "Contato - #{@subject}"
    )
  end
end
