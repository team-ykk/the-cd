class AddEnduserIdToCntact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :enduser_id, :integer
  end
end
