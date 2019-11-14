class RenameUserToEnduser < ActiveRecord::Migration[5.2]
  def change
  	rename_table :users, :endusers
  end
end
