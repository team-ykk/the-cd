class Publics::ContactsController < Publics::ApplicationController

  def new
  	  @contact = Contact.new
  end

  def create
  	  @contact = Contact.new(contact_params)
  	  @contact.enduser_id = current_enduser.id
  	  @contact.save
  	  redirect_to contacts_complete_path
  end

  def complete
  end

  private
  def contact_params
  	  params.require(:contact).permit(:contact_content)
  end
end

