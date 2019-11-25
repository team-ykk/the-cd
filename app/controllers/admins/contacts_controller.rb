class Admins::ContactsController < Admins::ApplicationController
  def index
  	  @contacts = Contact.page(params[:page]).reverse_order
  end

  def show
  	  @contact = Contact.find(params[:id])
      @reply = ContactReply.find_by(contact_id: @contact.id)
  end
end
