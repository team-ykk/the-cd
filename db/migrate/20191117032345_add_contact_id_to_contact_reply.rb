class AddContactIdToContactReply < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_replies, :contact_id, :integer
  end
end
