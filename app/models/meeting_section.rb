class MeetingSection < ApplicationRecord
  has_many :course_times
  has_many :instructors
  
end
