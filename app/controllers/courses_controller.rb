class CoursesController < ApplicationController

  def index
    @courses = []
    if params[:course]
      response = HTTParty.get("http://localhost:4242/1.0/courses/filter?q=name:'#{params[:course]} OR code:'#{params[:course]}&limit=100")
      parsed_reponse = JSON.parse(response.body)
      parsed_reponse.each do |course|
        @courses << {
          code: course['code'],
          name: course['name'],
          description: course['description']
        }
      end
    end
  end

end
