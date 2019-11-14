require 'test_helper'

class Admins::FreightsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admins_freights_edit_url
    assert_response :success
  end

end
