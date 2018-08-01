Product.destroy_all
User.destroy_all

snail_mucin_ingredients = [
  "Snail Secretion Filtrate", 
  "Betaine", 
  "Butylene Glycol", 
  "1,2-Hexanediol", 
  "Sodium Hyaluronate", 
  "Panthenol", 
  "Arginine", 
  "Allantoin", 
  "Ethyl Hexanediol", 
  "Sodium Polyacrylate", 
  "Carbomer", 
  "Phenoxyethanol"
]

user1 = User.new(email: "hello@nothanks.com", username: 'user1', password: '123456')
user1.save!

user2 = User.new(email: "testing@example.com", username: 'user2', password: '654321')
user2.save!

klairs_toner = Product.find_or_create_by(
  name: "Supple Preparation Toner",
  comment: "This definitely made a big difference in my skin. Loved how hydrating it was. I do think it was causing bumps, though.",
  rating: 5,
  price_cents: "22.00",
  link: "https://sokoglam.com/products/klairs-supple-preparation-facial-toner-180ml",
  repurchase: :no,
  product_type: :toner,
  brand: Brand.find_or_create_by(name: "Klairs"),
  user: user1
)

klairs_toner.tags.find_or_create_by(name: "hydrating")
klairs_toner.tags.find_or_create_by(name: "brightening")

embryolisse = Product.find_or_create_by(
  name: "Lait Creme Concentre",
  comment: "Love this cream. A perfect cream.",
  rating: 9,
  price_cents: "28.00",
  link: "https://www.dermstore.com/product_Lait+Creme+Concentre_51945.htm",
  repurchase: :yes,
  product_type: :moisturizer,
  brand: Brand.find_or_create_by(name: "Embryolisse"),
  user: user1
)

embryolisse.tags.find_or_create_by(name: "moisturizing")
embryolisse.tags.find_or_create_by(name: "repairing")

snail_mucin = Product.find_or_create_by(
  name: "Advanced Snail 96 Mucin Power Essence",
  comment: "A very good serum! Not sure how much it does, but it's nice and non-irritating.",
  rating: 8,
  price_cents: "19.00",
  link: "https://sokoglam.com/products/cosrx-advanced-snail-96-mucin-power-essence",
  repurchase: :yes,
  product_type: :serum,
  brand: Brand.find_or_create_by(name: "CosRX"),
  user: user2
)

snail_mucin.tags.find_or_create_by(name: "repairing")
snail_mucin.ingredients.find_or_create_by(name: "hydrating")

snail_mucin_ingredients.each do |ingredient_name|
  snail_mucin.ingredients.create!(name: ingredient_name)
end

Product.find_or_create_by(
  name: "The After Show Treatment Cleanser",
  comment: "I've heard really good things about how gentle it is, and want to try it.",
  price_cents: "20.00",
  link: "https://jordansamuelskin.com/products/plie-treatment-cleanser",
  product_type: :water_based_cleanser,
  wishlist: true,
  brand: Brand.find_or_create_by(name: "Jordan Samuels Skin"),
  user: user2
)
