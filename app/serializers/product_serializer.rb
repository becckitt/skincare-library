class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :comment, :rating, :price_cents, :repurchase, :product_type, :wishlist
  link :link
  has_many :tags, through: :product_tags
  has_many :ingredients, through: :product_ingredients
  belongs_to :brand
end
