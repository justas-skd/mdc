class AddPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :purchase_price, :float
    add_column :products, :sale_price, :float
    add_column :products, :vat, :integer
  end
end
