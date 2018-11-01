class UpdatePriceCentsColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price_cents, :float
  end
end
