class AddActualPriceToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :actual_price, :decimal
  end
end
