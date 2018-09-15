class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :firebase_id, presence: true, uniqueness: true
end
