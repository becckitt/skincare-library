class CreateShelves < ActiveRecord::Migration[5.2]
  def change
    create_table :shelves do |t|
      t.timestamps
    end

    add_column :products, :shelf_id, :integer
  end
end