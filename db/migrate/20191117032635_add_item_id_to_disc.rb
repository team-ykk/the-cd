class AddItemIdToDisc < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :item_id, :integer
  end
end
