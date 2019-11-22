class Admins::ContactRepliesController < Admins::ApplicationController
  def update
      @reply = ContactReply.find(params[:id])
      @contact = Contact.find_by(contact_reply_id: @reply.id)
      @reply.update(contact_reply_params)
      ContactMailer.send_when_admin_reply(@contact.enduser, @reply.reply_content).deliver
      redirect_to  admins_contacts_path
  end

  private
  def contact_reply_params
  	  params.require(:contact_reply).permit(:reply_content)
  end
end
