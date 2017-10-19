require "rails_helper"
require "httparty"

RSpec.describe CoursesController do

  describe "GET search" do

    it "test endpoint response is successfull" do
      expect(response.code).to eq("200")
    end

    it "test search returns JSON" do
      get :search, :params => {:course => 'math'}
      expect(response.header['Content-Type']).to include('application/json')
    end

    it "test endpoint response includes course" do
      course = Course.create(code: "ACT230H1F", name: "Mathematics of Finance for Non-Actuaries", description: "Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", department: "Statistical Sciences", prerequisites: nil, exclusions: nil, level: 200, campus: "UTSG", term: "2017 Fall")

      get :search, :params => {:course => 'math'}
      expect(JSON.parse(response.body).first["code"]).to eq(course.code)
    end

    it "test endpoint search limits based on limit entered" do

      10.times do
        course = Course.create(code: "ACT230H1F", name: "Mathematics of Finance for Non-Actuaries", description: "Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", department: "Statistical Sciences", prerequisites: nil, exclusions: nil, level: 200, campus: "UTSG", term: "2017 Fall")
      end

      limit = 10
      get :search, :params => {:course => 'math', :limit => limit}
      expect(JSON.parse(response.body).length).to eq(limit)
    end

    it "test endpoint actual response with limit '1' and query string equal to 'math' " do

      limit = 1

      10.times do
        course = Course.create(code: "ACT230H1F", name: "Mathematics of Finance for Non-Actuaries", description: "Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", department: "Statistical Sciences", prerequisites: nil, exclusions: nil, level: 200, campus: "UTSG", term: "2017 Fall")
      end

      get :search, :params => {:course => 'math', :limit => limit}
      expect(JSON.parse(response.body).length).to eq(limit)

    end
  end

  describe "GET get_data" do

    it "test endpoint response is successfull" do
      expect(response.code).to eq("200")
    end

    it "test endpoint returns JSON" do

      course = Course.create(code: "ACT230H1F", name: "Mathematics of Finance for Non-Actuaries", description: "Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", department: "Statistical Sciences", prerequisites: nil, exclusions: nil, level: 200, campus: "UTSG", term: "2017 Fall")

      get :get_data, :params => {:course_id => course.id}
      expect(response.header['Content-Type']).to include('application/json')
    end

    it "test endpoint response includes course" do
      course = Course.create(code: "ACT230H1F", name: "Mathematics of Finance for Non-Actuaries", description: "Introduction to financial mathematics, interest measurement, present value calculation, annuity valuation, loan amortization, consumer financing arrangements, bond valuation. The course is aimed at a general audience who will not be continuing in the actuarial science program.", department: "Statistical Sciences", prerequisites: nil, exclusions: nil, level: 200, campus: "UTSG", term: "2017 Fall")

      get :get_data, :params => {:course_id => course.id}
      expect(JSON.parse(response.body)["code"]).to eq(course.code)
    end
  end

end
