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
  has_many :ingredients
end
