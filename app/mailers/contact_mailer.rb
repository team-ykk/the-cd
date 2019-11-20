class ContactMailer < ApplicationMailer
	default from:    "管理人 <from@example.com>",
  	layout 'mailer'

  	def send_when_admin_reply(enduser, contact)
  		@enduser = enduser #ユーザー情報
  		@answer = contact.contact_content #返信内容
  		mail to: user.email, subject: '[THE CD]お問い合わせありがとうございます'
  	end
end
