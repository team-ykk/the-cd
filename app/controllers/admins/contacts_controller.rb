class Admins::ContactsController < Admins::ApplicationController
  def index
  	  @contact = Contact.page(params[:page]).reverse_order
  end
end
