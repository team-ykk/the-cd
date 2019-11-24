class RenameTotalePriceColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :totale_price, :total_price
  end
end
