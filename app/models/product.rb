class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100#"}
  validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}
  class << self
    def search(query)
      if query
        query = query.upcase
        where('upper(name) LIKE ? ', "%#{query}%")
      else
        self
      end
    end

    def good_products
      Product.where(effective: true, wishlist: false)
    end

    def bad_products
      Product.where(effective: false, wishlist: false)
    end

    def wishlist
      Product.where(wishlist: true)
    end
  end
end
