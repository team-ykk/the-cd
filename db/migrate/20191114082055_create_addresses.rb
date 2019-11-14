class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode
      t.string :name
      t.integer :prefecture_id
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
