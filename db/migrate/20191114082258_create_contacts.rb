class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :contact_content
      t.boolean :status

      t.timestamps
    end
  end
end
