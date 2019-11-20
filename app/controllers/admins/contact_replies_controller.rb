class Admins::ContactRepliesController < Admins::ApplicationController
  def show
  	  @contact = Contact.find(params[:id])
  	  @reply = ContactReply.new
  end

  def create
  end

  def update
  	  contact = Contact.find(params[:id])
  	  contact.update(contact_params)
  	  enduser = contact.enduser
  	  ContactMailer.send_when_admin_reply(enduser, contact).deliver
  end

end
