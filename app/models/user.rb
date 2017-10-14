class User < ApplicationRecord
  # has_and_belongs_to_many :courses
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
