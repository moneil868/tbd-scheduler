require "rails_helper"
require "httparty"

RSpec.describe CoursesController do

  describe "GET search" do
    it "test API response is successfull" do
      # math = 'math'
      # query = HTTParty.get("http://localhost:3000/courses/search?course=#{math}")
      # get :search
      # expect(query.response.code).to eq("200")

      params = [{}]
      params[:course] = 'math'
      get :search
      expect(query.response.code).to eq("200")
    end

    # it "test search returns JSON" do
    #   query = HTTParty.get('http://localhost:3000/courses/search?course=math')
    #   get :search
    #   expect(search.response.header['Content-Type']).to include('application/json')
    # end
    #
    # it "test search limits based on limit entered" do
    #   limit = 20
    #   query = HTTParty.get("http://localhost:3000/courses/search?course=math&limit=#{limit}")
    #   get :search
    #   expect(search.length).to eq(limit)
    # end

    # it "test actual response with limit '1' and query string equal to 'math' " do
    #   limit = 1
    #   null = nil
    #   response = HTTParty.get("http://localhost:3000/courses/search?course=math&limit=#{limit}")
    #   parsed_response = JSON.parse(response.body)
    #   expected = [{"id"=>15, "created_at"=>"2017-10-15T16:05:35.312Z", "updated_at"=>"2017-10-15T16:05:35.312Z", "code"=>"ACT230H1F", "name"=>"Mathematics of Finance for Non-Actuaries", "description"=>"Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", "department"=>"Statistical Sciences", "prerequisites"=>nil, "exclusions"=>nil, "level"=>200, "campus"=>"UTSG", "term"=>"2017 Fall"}]
    #   get :search
    #   expect(parsed_response).to eq(expected)
    # end
  end

  describe "GET get_data" do
    # it "test API response is successfull" do
    #   id = 200
    #   query = HTTParty.get("http://localhost:3000/courses/get_data?course_id=#{id}")
    #   get :get_data
    #   expect(query.response.code).to eq("200")
    # end
  end

end
