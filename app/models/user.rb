class User < ApplicationRecord
  has_many :courses
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
