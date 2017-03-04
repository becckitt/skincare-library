class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100#"}
  validates_attachment :photo, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png"]}
  class << self
    def good_products
      Product.all.select{ |product| product.effective }
    end

    def bad_products
      Product.all.select{ |product| !product.effective }
    end
  end
end
