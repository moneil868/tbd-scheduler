class CoursesController < ApplicationController

  def index
    @courses = Course.search(params[:course])

    @courses = if params[:course]
      Course.where('course_code LIKE ?', "%#{params[:course]}%")
    else
      Course.all
    end

  end


  private

  def course_filter_search(query)
    response = HTTParty.get("http://localhost:4242/1.0/courses/filter?q=name:'#{query}' OR code:'#{query}'")

    JSON.parse(response.body)
  end
end
