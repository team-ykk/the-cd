class AddContactReplyIdToContacs < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :contact_reply_id, :integer
  end
end
