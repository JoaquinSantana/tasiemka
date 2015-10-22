class ContactsController < ApplicationController
  
  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: :nothing
    else
      render json: { error: 'something goes wrong' }
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :subscribe, :topic, :wiadomosc)
  end
end
