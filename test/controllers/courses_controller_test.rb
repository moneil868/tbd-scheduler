require 'test_helper'
require 'httparty'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "check meeting section id:55" do
    response = HTTParty.get('http://localhost:3000/courses/get_data?course_id=55')
    result = JSON.parse(response.body)

    assert_equal('Spacecraft Dynamics and Control', result.name)
  end

  test "index action should be success" do
    get :index
    assert_response :success
  end


end
