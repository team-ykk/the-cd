class AddEmailToContactReply < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_replies, :email, :string
  end
end
