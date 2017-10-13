class CoursesController < ApplicationController

  def index
    if params[:course]
      @courses = Course.search(params[:course])
    end
  end

end
