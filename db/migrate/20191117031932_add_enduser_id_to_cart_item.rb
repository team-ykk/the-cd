class AddEnduserIdToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :enduser_id, :integer
  end
end
