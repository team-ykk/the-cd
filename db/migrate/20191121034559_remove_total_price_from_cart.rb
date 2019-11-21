class RemoveTotalPriceFromCart < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :total_price, :integer
  end
end
