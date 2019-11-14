class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment
      t.integer :totale_price
      t.integer :status

      t.timestamps
    end
  end
end
