class FixBrandsAndTagsTables < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :name, :string
    add_column :brands, :name, :string
  end
end
