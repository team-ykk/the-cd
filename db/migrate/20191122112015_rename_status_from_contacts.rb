class RenameStatusFromContacts < ActiveRecord::Migration[5.2]
  def change
  	remove_column :contacts, :status, :boolean
  end
end
