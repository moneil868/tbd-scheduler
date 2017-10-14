class CoursesController < ApplicationController

  def index
    @courses = Course.all

    @courses = if params[:course]
      course_filter_search(params[:course])
    else
      @course = []
    end

  end


  private

  def course_filter_search(query)
    query = '%' + query + '%'
    Course.where('name ILIKE ?', query )
  end
end
