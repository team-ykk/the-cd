class AddTaxRateToTax < ActiveRecord::Migration[5.2]
  def change
    add_column :taxes, :tax_rate, :decimal
  end
end
