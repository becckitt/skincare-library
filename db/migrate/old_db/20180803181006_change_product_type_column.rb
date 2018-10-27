class ChangeProductTypeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :product_type, :string
  end
end
