class Product < ApplicationRecord
  enum product_type: {
    oil_cleanser: 0,
    water_based_cleanser: 1,
    exfoliator: 2,
    toner: 3,
    essence: 4,
    serum: 5,
    mask: 6,
    eye_cream: 7,
    moisturizer: 8,
    oil: 9,
    sunscreen: 10,
    retinol: 11
  }
  enum repurchase: { yes: 0, maybe: 1, no: 2 }
  has_many :product_tags
  has_many :tags, through: :product_tags
  has_many :product_ingredients
  has_many :ingredients, through: :product_ingredients
  belongs_to :brand
  belongs_to :user
end
