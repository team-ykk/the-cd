class AddIndexToEnduser < ActiveRecord::Migration[5.2]
  def change
  	remove_index :endusers, column: :email
  	remove_index :endusers, column: :reset_password_token
  	add_index :endusers, :email, unique: true, where: 'deleted_at IS NULL'
  	add_index :endusers, :reset_password_token, unique: true, where: 'deleted_at IS NULL'
  end
end
