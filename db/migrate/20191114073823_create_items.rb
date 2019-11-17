class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.date :shipdate
      t.integer :price
      t.integer :stock
      t.boolean :status
      t.string :item_profile_id
      t.datetime :deleted_at

      t.timestamps
      t.index :item_name

    end
  end
end
