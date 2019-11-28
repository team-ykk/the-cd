class Admins::ContactRepliesController < Admins::ApplicationController
  def update
      @reply = ContactReply.find(params[:id])
      @contact = Contact.find_by(contact_reply_id: @reply.id)
    if @reply.update(contact_reply_params)
      ContactMailer.send_when_admin_reply(@contact.enduser, @reply.reply_content).deliver
      redirect_to  admins_contacts_path
    else
      flash.now[:notbuy] = "お問い合わせ返信フォームを記入してください"
      render 'admins/contacts/show'
    end
  end

  private
  def contact_reply_params
  	  params.require(:contact_reply).permit(:reply_content)
  end
end
