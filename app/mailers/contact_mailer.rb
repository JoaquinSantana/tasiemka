class ContactMailer < ActionMailer::Base
  default to: "informacje@tasiemka.info"

  def new_contact(contact)
    @contact = contact
    
    if @contact.subscribe?
      @email = @contact.email
    elsif !@contact.subscribe? && !@contact.email.blank?
      @email = @contact.email
    else
      @email = "Anonim@something.com"
    end

    mail(from: @email, subject: "#{contact.wiadomosc}")
  end
end
