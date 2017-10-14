class Course < ApplicationRecord
  has_many :meeting_sections
  has_many :instructors, through: :meeting_sections
  has_many :course_times, through: :meeting_sections
  # has_and_belongs_to_many :users

end
