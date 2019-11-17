class AddItemIdToAddItem < ActiveRecord::Migration[5.2]
  def change
    add_column :additems, :item_id, :integer
  end
end
