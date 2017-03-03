class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.text :comment
      t.boolean :effective
      t.timestamps null: false
    end
  end
end
