class Course < ApplicationRecord
  has_many :meeting_sections
  has_many :instructors, through: :meeting_sections
  has_many :course_times, through: :meeting_sections
  # has_and_belongs_to_many :users

  def self.course_filter_search(query)
    query = '%' + query + '%'
    Course.where('name ILIKE ?', query )
  end

  def self.get_ms_data(meeting_sections)
    meeting_sections.map do |each_ms|
      {
      code: each_ms.code,
      id: each_ms.id,
      course_times: get_each_course_time(each_ms)
      }
    end
  end

  def get_each_course_time(each_ms)
    each_ms.course_times do |course_time|
      {
        day: course_time.day,
        start: course_time.start,
        end: course_time.end,
        duration: course_time.duration,
        location: course_time.location
      }
    end
  end

end
