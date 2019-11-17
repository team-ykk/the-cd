class AddEnduserIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :enduser_id, :integer
  end
end
