class AddEnduserIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :enduser_id, :integer
  end
end
