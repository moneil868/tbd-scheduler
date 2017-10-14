class CoursesController < ApplicationController

  def index
    @courses = Course.all

    @courses = if params[:course]
      Course.course_filter_search(params[:course])
    else
      @course = []
    end

  end

end
