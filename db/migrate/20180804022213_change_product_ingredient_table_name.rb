class ChangeProductIngredientTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_ingredients, :ingredients_products
    rename_table :product_tags, :products_tags
  end
end
