require "rails_helper"

RSpec.describe Product, :type => :model do
  before(:all) do
    @product1 = create(:product)
  end

  it "has a name" do
    expect(@product1.name).to eq("Advanced Snail 96 Mucin Power Essence")
  end

  it "has a repurchase enum value" do
    expect(@product1.repurchase).to eq("yes")
  end

  it "is a wishlist item" do
    expect(@product1.wishlist).to be true
  end

  it "has related tags" do 
    product2 = create(:product_with_tags)
    expect(product2.tags.first.name).to eq("hydrating")
  end

  it "belongs to a brand" do
    expect(@product1.brand.name).to eq("CosRx")
  end

  it "has related ingredients" do
    product3 = create(:product_with_ingredients)
    expect(product3.ingredients.first.name).to eq("alcohol")
  end
end