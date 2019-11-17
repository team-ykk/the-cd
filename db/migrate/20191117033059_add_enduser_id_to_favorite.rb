class AddEnduserIdToFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :enduser_id, :integer
  end
end
