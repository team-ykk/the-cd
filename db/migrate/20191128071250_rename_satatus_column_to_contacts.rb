class RenameSatatusColumnToContacts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :contacts, :satatus, :status
  end
end
