require 'test_helper'

class Resolvers::ProductsSearchTest < ActiveSupport::TestCase
  def find(args)
    Resolvers::ProductsSearch.call(nil, args, nil)
  end

  def setup
    @product1 = create(:product)
  end

  test 'can find a product given a filter' do
    result = find(
      filter: {
        'name_contains': 'snail'
      }
    )

    assert_equal 1, result.count
  end
end