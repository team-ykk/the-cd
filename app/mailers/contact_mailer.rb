class ContactMailer < ApplicationMailer

  	def send_when_admin_reply(enduser, reply_content)#メールを送る際の必要な情報を引数として入れてあげる。
  		@enduser = enduser #ユーザー情報
  		@answer = reply_content #返信内容
  		mail to: enduser.email, subject: '[THE CD]お問い合わせありがとうございます'
  	end
end
