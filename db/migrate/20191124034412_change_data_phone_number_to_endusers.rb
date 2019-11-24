class ChangeDataPhoneNumberToEndusers < ActiveRecord::Migration[5.2]
  def change
  	 change_column :endusers, :phone_number, :string
  end
end
