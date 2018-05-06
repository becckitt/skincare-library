require "rails_helper"

RSpec.describe Product, :type => :model do
  before(:all) do
    @product1 = create(:product)
  end

  it "has a name" do
    expect(@product1.name).to eq("CosRX Advanced Snail 96 Mucin Power Essence")
  end

  it "has a repurchase enum value" do
    expect(@product1.repurchase).to eq("yes")
  end
end