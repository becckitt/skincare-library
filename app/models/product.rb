class Product < ApplicationRecord
  enum repurchase: { yes: 0, maybe: 1, no: 2 }
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :routines
  belongs_to :shelf, optional: true
  belongs_to :brand
  belongs_to :user
end
