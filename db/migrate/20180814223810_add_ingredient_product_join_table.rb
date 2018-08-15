class AddIngredientProductJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :products_routines do |t|
      t.belongs_to :product, index: true
      t.belongs_to :routine, index: true
      t.timestamps
    end
  end
end
