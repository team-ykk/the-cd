class RemoveEnduserIdFromCartItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :enduser_id, :integer
  end
end
