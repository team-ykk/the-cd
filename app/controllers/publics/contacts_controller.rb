class Publics::ContactsController < Publics::ApplicationController

  def new
  	  @contact = Contact.new
  end

  def create
  	  @contact = Contact.new(contact_params)
  	  @contact.enduser_id = current_enduser.id
  	   if @contact.save
          @reply = ContactReply.new
          @reply.contact_id = @contact.id
          @reply.save
          @contact.contact_reply_id = @reply.id
          @contact.update(contact_params)
          redirect_to contacts_complete_path
        else
          render 'new'
      end
  end

  def complete
  end

  private
  def contact_params
  	  params.require(:contact).permit(:contact_content)
  end
end

