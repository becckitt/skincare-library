class CorrectWishlist < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :wishlist, :boolean
    drop_table :wishlists
  end
end
