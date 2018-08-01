class Resolvers::CreateProduct < GraphQL::Function
  argument :name, !types.String

  type Types::ProductType

  def call(_obj, args, _ctx)
    Product.create!(
      name:         args[:name],
      comment:      args[:comment],
      price_cents:  args[:price_cents],
      link:         args[:link],
      repurchase:   args[:repurchase],
      product_type: args[:product_type],
      wishlist:     args[:wishlist],
      brand:        args[:brand],
      user:         ctx[:current_user]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")  
  end
end