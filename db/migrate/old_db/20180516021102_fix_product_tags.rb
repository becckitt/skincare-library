class FixProductTags < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_tags

    create_table :product_tags do |t|
      t.belongs_to :product, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
