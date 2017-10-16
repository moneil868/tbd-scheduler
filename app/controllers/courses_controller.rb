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
        'OR code ILIKE ?', "%#{course}%", "%#{course}%") if course

    render json: courses
  end

  def get_data
    course = Course.find(params[:course_id])
    meeting_sections = course.meeting_sections
    meeting_sections_data = meeting_sections.map do |each_ms|
      {
        code: each_ms.code,
        id: each_ms.id
      }
    end

    render json: {
      name:        course.name,
      code:        course.code,
      description: course.description,
      department:  course.department,
      ms_data:     meeting_sections_data,
      term:        course.term
    }
  end

end
