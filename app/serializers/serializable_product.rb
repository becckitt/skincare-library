# Serializers define the rendered JSON for a model instance.
# We use jsonapi-rb, which is similar to active_model_serializers.
class SerializableProduct < JSONAPI::Serializable::Resource
  type :products

  attribute :name
  attribute :comment
  attribute :link
  attribute :rating
  attribute :price_cents
  attribute :repurchase
  attribute :product_type
  attribute :wishlist
end
