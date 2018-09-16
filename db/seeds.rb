Product.destroy_all
User.destroy_all
Ingredient.destroy_all
Routine.destroy_all

snail_mucin_ingredients = ["Snail Secretion Filtrate", "Betaine", "Butylene Glycol", "1,2-Hexanediol", "Sodium Hyaluronate", "Panthenol", "Arginine", "Allantoin", "Ethyl Hexanediol", "Sodium Polyacrylate", "Carbomer", "Phenoxyethanol"]
honey_ceramide_ingredients = ["Honey extract", "butylene glycol", "glycerin", "caprylic/capric triglyceride", "helianthus annuus (sunflower) seed oil", "betaine", "cetearyl olivate", "sorbitan olivate", "dimethicone", "2-hexanediol", "beeswax", "elaeis guineensis(palm) oil", "elaeis guineensis(palm) kernel oil", "hordeum vulgare leaf extract", "cetearyl alcohol ydroxyethyl acrylate/sodium acryloyldimethyl taurate", "copolymer", "ethylhexylglycerin", "sodium hyaluronate", "ceramide 3", "xanthan gum", "adenosine"]

snail_mucin_tags = ["hydrating", "antimicrobial", "repairing"]
klairs_toner_tags = ["hydrating", "essential oils", "brightening"]

user1 = User.new(email: "hello@nothanks.com", firebase_id: '43543nmenw432')
user1.save!

user2 = User.new(email: "testing@example.com", firebase_id: 'fdsjhkh3432re2')
user2.save!

klairs_toner = Product.find_or_create_by(
  name: "Supple Preparation Toner",
  comment: "This definitely made a big difference in my skin. Loved how hydrating it was. I do think it was causing bumps, though.",
  rating: 7,
  price_cents: "22.00",
  link: "https://sokoglam.com/products/klairs-supple-preparation-facial-toner-180ml",
  repurchase: :maybe,
  product_type: "toner",
  brand: Brand.find_or_create_by(name: "Klairs"),
  user: user1
)

embryolisse = Product.find_or_create_by(
  name: "Lait Creme Concentre",
  comment: "Love this cream. A perfect cream.",
  rating: 9,
  price_cents: "28.00",
  link: "https://www.dermstore.com/product_Lait+Creme+Concentre_51945.htm",
  repurchase: :yes,
  product_type: "moisturizer",
  brand: Brand.find_or_create_by(name: "Embryolisse"),
  user: user1
)

snail_mucin = Product.find_or_create_by(
  name: "Advanced Snail 96 Mucin Power Essence",
  comment: "A very good serum! Not sure how much it does, but it's nice and non-irritating.",
  rating: 8,
  price_cents: "19.00",
  link: "https://sokoglam.com/products/cosrx-advanced-snail-96-mucin-power-essence",
  repurchase: :yes,
  product_type: "serum",
  brand: Brand.find_or_create_by(name: "CosRX"),
  user: user2
)

Product.find_or_create_by(
  name: "The After Show Treatment Cleanser",
  comment: "I've heard really good things about how gentle it is, and want to try it.",
  price_cents: "20.00",
  link: "https://jordansamuelskin.com/products/plie-treatment-cleanser",
  product_type: "water based cleanser",
  wishlist: true,
  brand: Brand.find_or_create_by(name: "Jordan Samuels Skin"),
  user: user2
)

Product.find_or_create_by(
  name: "The Performance Cream",
  comment: "I'm looking for a good moisturizer still, but I trust anything he makes, so I'm curious to try this.",
  price_cents: "32.00",
  link: "https://jordansamuelskin.com/products/",
  product_type: "moisturizer",
  wishlist: true,
  brand: Brand.find_or_create_by(name: "Jordan Samuels Skin"),
  user: user2
)

acwell_toner = Product.find_or_create_by(
  name: "5.5 Toner",
  comment: "I really love this, the feel is so nice.",
  price_cents: "18.00",
  link: "https://sokoglam.com/",
  product_type: "toner",
  repurchase: :yes,
  rating: 9,
  wishlist: false,
  brand: Brand.find_or_create_by(name: "ACWell"),
  user: user2
)

honey_ceramide = Product.find_or_create_by(
  name: "Honey Ceramide Cream",
  comment: "It's thicker, but it's really good",
  price_cents: "22.00",
  link: "https://cosrx.com/",
  product_type: "moisturizer",
  wishlist: false,
  repurchase: :maybe,
  rating: 6,
  brand: Brand.find_or_create_by(name: "CosRX"),
  user: user2
)

liquid_gold = Product.find_or_create_by(
  name: "Liquid Gold",
  comment: "Love this. It's a great lightweight moisturizer for summer and a good serum for winter.",
  price_cents: "24.00",
  link: "https://stratia.com/",
  product_type: "moisturizer",
  wishlist: false,
  repurchase: :yes,
  rating: 10,
  brand: Brand.find_or_create_by(name: "Stratia"),
  user: user2
)

cerave_cleanser = Product.find_or_create_by(
  name: "Hydrating Cleanser",
  comment: "Really gentle cleanser, very nice",
  price_cents: "11.00",
  link: "https://amazon.com/",
  product_type: "water based cleanser",
  wishlist: false,
  repurchase: :yes,
  rating: 7,
  brand: Brand.find_or_create_by(name: "Cerave"),
  user: user2
)

micellar_water = Product.find_or_create_by(
  name: "Micellar Water",
  comment: "This gets rid of EVERYTHING. So gentle.",
  price_cents: "9.00",
  link: "https://amazon.com/",
  product_type: "micellar water",
  wishlist: false,
  repurchase: :yes,
  rating: 10,
  brand: Brand.find_or_create_by(name: "Garnier"),
  user: user2
)

eve_lom_cleanser = Product.find_or_create_by(
  name: "Morning Gel Cleanser",
  comment: "I like this, but idk if it's super necessary considering my other cleansers. It does smell good though.",
  price_cents: "60.00",
  link: "https://sephora.com/",
  product_type: "oil cleanser",
  wishlist: false,
  repurchase: :no,
  rating: 5,
  brand: Brand.find_or_create_by(name: "Eve Lom"),
  user: user2
)

Product.find_or_create_by(
  name: "Moisturizing face cream",
  comment: "This is such a good cream, but way too expensive to use beyond the one trial size I got :(((((",
  price_cents: "200.00",
  link: "https://stratia.com/",
  product_type: "moisturizer",
  wishlist: false,
  repurchase: :no,
  rating: 10,
  brand: Brand.find_or_create_by(name: "Barbara Sturm"),
  user: user2
)

snail_mucin_ingredients.each do |ingredient_name|
  i = Ingredient.find_or_create_by!(name: ingredient_name)
  snail_mucin.ingredients << i
end

honey_ceramide_ingredients.each do |ingredient_name|
  i = Ingredient.find_or_create_by!(name: ingredient_name)
  honey_ceramide.ingredients << i
end

snail_mucin_tags.each do |tag_name|
  t = Tag.find_or_create_by!(name: tag_name)
  snail_mucin.tags << t
end

klairs_toner_tags.each do |tag_name|
  t = Tag.find_or_create_by!(name: tag_name)
  klairs_toner.tags << t
end

routine_1 = Routine.create!(
  user: user1,
  time_of_day: :am
)

routine_2 = Routine.create!(
  user: user1,
  time_of_day: :pm
)

routine_1_products = [
  micellar_water, cerave_cleanser, snail_mucin, liquid_gold
]

routine_1_products.each { |p| routine_1.products << p }

routine_2_products = [
  eve_lom_cleanser, acwell_toner, embryolisse
]

routine_2_products.each { |p| routine_2.products << p }
  