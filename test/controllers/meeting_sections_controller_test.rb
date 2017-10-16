require 'test_helper'

class MeetingSectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get meeting_sections_search_url
    assert_response :success
  end

end
