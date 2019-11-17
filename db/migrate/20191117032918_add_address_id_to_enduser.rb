class AddAddressIdToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :address_id, :integer
  end
end
