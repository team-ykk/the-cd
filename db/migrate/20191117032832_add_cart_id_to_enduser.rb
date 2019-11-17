class AddCartIdToEnduser < ActiveRecord::Migration[5.2]
  def change
    add_column :endusers, :cart_id, :integer
  end
end
