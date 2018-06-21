# Define payloads that can be re-used across endpoints.
# For additional documentation, see https://jsonapi-suite.github.io/strong_resources
StrongResources.configure do
  strong_resource :product do
    attribute :name, :string
    attribute :comment, :string
    attribute :link, :string
    attribute :rating, :string
    attribute :price_cents, :string
    attribute :repurchase, :string
    attribute :product_type, :string
    attribute :wishlist, :string
  end
end