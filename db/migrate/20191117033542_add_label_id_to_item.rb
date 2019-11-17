class AddLabelIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :label_id, :integer
  end
end
