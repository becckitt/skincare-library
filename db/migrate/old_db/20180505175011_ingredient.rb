class Ingredient < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :name, :string
  end
end
