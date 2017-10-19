class CoursesController < ApplicationController

  def index
    @courses = Course.all

    @courses = if params[:course]
      self.course_filter_search(params[:course])
    else
      @course = []
    end
  end

  def search
    course = params[:course] || nil
    courses = []
    courses = Course
      .where('name ILIKE ? '\
        'OR code ILIKE ?', "%#{course}%", "%#{course}%").first(10) if course

    render json: courses
  end

  def get_data
    course = Course.find(params[:course_id])
    meeting_sections = course.meeting_sections
    meeting_sections_data = get_ms_data(meeting_sections)


    render json: {
      name:        course.name,
      code:        course.code,
      description: course.description,
      department:  course.department,
      ms_data:     meeting_sections_data,
      term:        course.term
    }
  end

  private

  def get_ms_data(meeting_sections)
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
