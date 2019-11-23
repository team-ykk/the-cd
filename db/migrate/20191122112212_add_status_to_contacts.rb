class AddStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :satatus, :boolean, default: false, null: false
  end
end
