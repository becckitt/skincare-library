require 'test_helper'

class KeywordTest < ActiveSupport::TestCase
  before(:all) do
    @product1 = create(:product)
  end

  test 'has a name' do
    expect(@product1.name).to eq('Advanced Snail 96 Mucin Power Essence')
  end

  test 'has a repurchase enum value' do
    expect(@product1.repurchase).to eq('yes')
  end

  test 'is a wishlist item' do
    expect(@product1.wishlist).to be true
  end

  test 'has related tags' do 
    # figure out a better way to do this later but rn 
    # i could care less about the right way to properly
    # cleanup after a test!!!!
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    product2 = create(:product_with_tags)
    expect(product2.tags.first.name).to eq('hydrating')
  end

  test 'belongs to a brand' do
    expect(@product1.brand.name).to eq('CosRx')
  end

  test 'has related ingredients' do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    product3 = create(:product_with_ingredients)
    expect(product3.ingredients.first.name).to eq('alcohol')
  end
end