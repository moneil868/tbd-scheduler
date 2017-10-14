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

end
