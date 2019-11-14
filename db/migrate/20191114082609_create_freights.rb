class CreateFreights < ActiveRecord::Migration[5.2]
  def change
    create_table :freights do |t|
      t.integer :postage

      t.timestamps
    end
  end
end
