class Publics::ContactsController < Publics::ApplicationController
  def new
  	  @contact = Contact.new
  end

  def create
  	  @contact =Content.find(params)
  	  @contact.user_id = current_user.id
  	  @contact.save
  	  redirect_to contacts_complete_path
  end

  def complete
  end

  private
  def contacts_prams
  	  params.require(:contacts).permit(:contact_content, :statu)
  end
end
