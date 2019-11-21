class ContactMailer < ApplicationMailer

  	def send_when_admin_reply(enduser, contact_reply)
  		@enduser = enduser #ユーザー情報
  		@reply = contact_reply.reply_content #返信内容
  		mail to: enduser.email, subject: '[THE CD]お問い合わせありがとうございます'
  	end
end
