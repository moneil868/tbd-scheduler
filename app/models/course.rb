class Course < ApplicationRecord
  has_many :users

  def self.search(course)
    if course
      where('name LIKE ?', "%#{course}%")
    else
      all
    end
  end


end
