FactoryBot.define do
  sequence(:tag_id) {|n| n }
  sequence(:product_id) {|n| n }
  sequence(:ingredient_id) {|n| n }

  factory :product do
    name "Advanced Snail 96 Mucin Power Essence"
    brand { create :brand }
    user { create :user }
    comment "Super nice and moisturizing, I think it works but will wait and see if I notice a difference after I run out"
    rating 8
    price_cents 19
    repurchase :yes
    product_type :serum
    link "https://sokoglam.com/products/cosrx-advanced-snail-96-mucin-power-essence"
    wishlist true

    factory :product_with_tags do
      after(:create) do |product|
        tag = create(:tag)
        create(:product_tag, tag_id: tag.id, product_id: product.id)
      end
    end

    factory :product_with_ingredients do
      after(:create) do |product|
        ingredient = create(:ingredient)
        create(:product_ingredient, product_id: product.id, ingredient_id: ingredient.id)
      end
    end
  end

  factory :product_tag do
    product_id
    tag_id
  end

  factory :tag do
    name "hydrating"
  end

  factory :product_ingredient do
    product_id
    ingredient_id
  end

  factory :ingredient do
    name "alcohol"
  end

  factory :brand do
    name "CosRx"
  end

  factory :user do
    username "Joe10"
    email "joe10@gmail.com"
    password "notpassword"
  end

  factory :routine do
    
  end
end