class CreateAdditems < ActiveRecord::Migration[5.2]
  def change
    create_table :additems do |t|
      t.integer :add_item

      t.timestamps
    end
  end
end
