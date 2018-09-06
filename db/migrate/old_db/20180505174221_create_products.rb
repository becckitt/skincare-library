class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :comment
      t.integer :rating
      t.monetize :price
      t.text :link
      t.integer :repurchase

      t.timestamps
    end
  end
end
