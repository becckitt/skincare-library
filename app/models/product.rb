class Product < ActiveRecord::Base
  class << self
    def good_products
      Product.all.select{ |product| product.effective }
    end

    def bad_products
      Product.all.select{ |product| !product.effective }
    end
  end
end
