class Resolvers::CreateProduct < GraphQL::Function
  argument :name, !types.String
  argument :comment, !types.String
  argument :price_cents, !types.String
  argument :product_type, !types.String
  argument :link, !types.String
  argument :rating, !types.String
  argument :repurchase, !types.String
  argument :wishlist, !types.String
  argument :brand, !types.String
  argument :user, !types.String
  
  type Types::ProductType

  def call(_obj, args, _ctx)
    brand = Brand.find_or_create_by(name: args[:brand])
    user = User.find_by(email: 'hello@beccabarton.com')
    product = Product.find_or_create_by(name: args[:name], brand: brand, user: user)

    product.update_attributes(
      comment:      args[:comment],
      product_type: args[:product_type].downcase,
      price_cents:  args[:price_cents],
      link:         args[:link],
      rating:       args[:rating],
      repurchase:   args[:repurchase].downcase,
      wishlist:     args[:wishlist]
    )
    
    product
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")  
  end
end