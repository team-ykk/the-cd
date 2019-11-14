class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :item_name
      t.string :artist_name
      t.integer :subtotal
      t.integer :quantity
      t.string :item_profile_id

      t.timestamps
    end
  end
end
