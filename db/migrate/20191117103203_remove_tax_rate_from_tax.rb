class RemoveTaxRateFromTax < ActiveRecord::Migration[5.2]
  def change
    remove_column :taxes, :tax_rate, :integer
  end
end
