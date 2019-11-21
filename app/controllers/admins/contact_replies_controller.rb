class Admins::ContactRepliesController < Admins::ApplicationController
  def show
  	  @contact = Contact.find(params[:id])
  	  @reply = ContactReply.new
  end

  def create
  	  @reply = ContactReply.new(reply_params)
  	  @reply = reply.save(reply_params)
  	  enduser = contact.enduser
  	  ContactMailer.send_when_admin_reply(enduser, contact).deliver
  end

  def update
  	  contact = Contact.find(params[:id])
  	  contact.update(contact_params)
  	  enduser = contact.enduser
  	  ContactMailer.send_when_admin_reply(enduser, contact).deliver
  end

  private
  def contact_reply_params
  	  params.require(:contact_reply).permit(:reply_content)
  end
end
