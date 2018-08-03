class Product < ApplicationRecord
  enum repurchase: { yes: 0, maybe: 1, no: 2 }
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  belongs_to :brand
  belongs_to :user
end
