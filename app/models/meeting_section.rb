class MeetingSection < ApplicationRecord
  has_many :course_times
  has_many :instructors
  belongs_to :course

end
