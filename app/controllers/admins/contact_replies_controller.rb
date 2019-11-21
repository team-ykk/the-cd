class Admins::ContactRepliesController < Admins::ApplicationController
  def show
  	  @contact = Contact.find(params[:id])
      @reply = ContactReply.new
  end

  def update
      @reply = ContactReply.find(params[:id])
      @reply.update(contact_reply_params)
      @enduser = ContactReply.contact.enduser
      @contact_reply = ContactReply.reply_content
      ContactMailer.send_when_admin_reply(@enduser, @contact_reply).deliver

  end

  private
  def contact_reply_params
  	  params.require(:contact_reply).permit(:reply_content)
  end
end
