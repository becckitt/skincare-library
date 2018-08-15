class Routine < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :user
  enum time_of_day: { am: 0, pm: 1 }
end
