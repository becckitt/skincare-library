require 'rails_helper'

class Resolvers::ProductsSearchTest < ActiveSupport::TestCase
  def find(args)
    Resolvers::ProductsSearch.call(nil, args, nil)
  end

  before(:all) do
    @product1 = create(:product)
  end

  result = find(
    filter: {
      'name_contains': 'snail'
    }
  )

  assert_equal result.count, 1
end