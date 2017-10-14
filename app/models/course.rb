class Course < ApplicationRecord
  has_many :meeting_sections
  has_and_belongs_to_many :users

end
