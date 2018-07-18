class FixWishlist < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :wishlist, :boolean, :default => false
  end
end
