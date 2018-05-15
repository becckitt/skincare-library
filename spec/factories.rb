FactoryBot.define do
  factory :tag do
    
  end
  factory :brand do
    
  end
  factory :user do
    username "Joe10"
    email "joe10@gmail.com"
    password "notpassword"
  end

  factory :product do
    name "CosRX Advanced Snail 96 Mucin Power Essence"
    comment "Super nice and moisturizing, I think it works but will wait and see if I notice a difference after I run out"
    rating 8
    price_cents 19
    repurchase :yes
    type :serum
    link "https://sokoglam.com/products/cosrx-advanced-snail-96-mucin-power-essence"
  end
end