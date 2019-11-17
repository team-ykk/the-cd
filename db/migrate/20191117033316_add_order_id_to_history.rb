class AddOrderIdToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :order_id, :integer
  end
end
