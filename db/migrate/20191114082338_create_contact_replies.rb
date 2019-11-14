class CreateContactReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_replies do |t|
      t.text :reply_content

      t.timestamps
    end
  end
end
