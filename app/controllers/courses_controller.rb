class CoursesController < ApplicationController
require "HTTParty"

  def index

  end


  private

  def course_filter_search(query)
    response = HTTParty.get("http://localhost:4242/1.0/courses/filter?q=name:'#{query}' OR code:'#{query}'")

    JSON.parse(response.body)
  end
end
