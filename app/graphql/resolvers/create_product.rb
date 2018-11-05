class Resolvers::CreateProduct < GraphQL::Function
  argument :input, Inputs::ProductInput
  
  type Types::ProductType

  def call(_obj, args, _ctx)
    input = args[:input]
    brand = Brand.find_or_create_by(name: input.brand)
    user = User.find_by(email: input.user)
    product = Product.find_or_create_by(name: input.name, brand: brand, user: user)

    # TODO: clean this up and simplify
    # also make it so we don't update if... nothing's there
    product.update_attributes(
      comment:      input.comment,
      product_type: input.product_type.downcase,
      price_cents:  input.price_cents,
      link:         input.link,
      rating:       input.rating,
      repurchase:   input.repurchase.downcase,
      wishlist:     input.wishlist
    )

    # create and add ingredients and tags to product
    input.ingredients.split(",").each do |ingredient|
      ingredient_name = ingredient.strip
      i = Ingredient.find_or_create_by(name: ingredient_name)
      product.ingredients << i
    end

    input.tags.split(",").each do |tag|
      tag_name = tag.strip
      t = Tag.find_or_create_by(name: tag_name)
      product.tags << t
    end

    product
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")  
  end
end