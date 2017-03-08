class AddLinkToProduct < ActiveRecord::Migration
  def change
    add_column :products, :link, :text
    add_column :products, :wishlist, :boolean
  end
end
