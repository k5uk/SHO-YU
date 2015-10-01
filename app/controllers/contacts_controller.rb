class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
        ContactMailer.sent(@contact).deliver
        ContactMailer.sent_toAdmin(@contact).deliver
        redirect_to sending_contact_path
    end
  end
  
  private
  
    def contact_params
      params.require(:contact).permit(:name, :age, :mail, :content)
    end
    
end
