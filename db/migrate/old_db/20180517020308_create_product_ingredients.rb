class CreateProductIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :product_ingredients do |t|
      t.belongs_to :product, index: true
      t.belongs_to :ingredient, index: true
      t.timestamps
    end
  end
end
