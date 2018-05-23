Product.find_or_create_by(
  name: "Supple Preparation Toner",
  comment: "This definitely made a big difference in my skin. Loved how hydrating it was. I do think it was causing bumps, though.",
  rating: 5,
  price_cents: "22.00",
  link: "https://sokoglam.com/products/klairs-supple-preparation-facial-toner-180ml",
  repurchase: :no,
  product_type: :toner,
  brand: Brand.find_or_create_by(name: "Klairs")
)

Product.find_or_create_by(
  name: "Lait Creme Concentre",
  comment: "Love this cream. A perfect cream.",
  rating: 9,
  price_cents: "28.00",
  link: "https://www.dermstore.com/product_Lait+Creme+Concentre_51945.htm",
  repurchase: :yes,
  product_type: :moisturizer,
  brand: Brand.find_or_create_by(name: "Embryolisse")
)

Product.find_or_create_by(
  name: "Advanced Snail 96 Mucin Power Essence",
  comment: "A very good serum! Not sure how much it does, but it's nice and non-irritating.",
  rating: 8,
  price_cents: "19.00",
  link: "https://sokoglam.com/products/cosrx-advanced-snail-96-mucin-power-essence",
  repurchase: :yes,
  product_type: :serum,
  brand: Brand.find_or_create_by(name: "CosRX")
)
