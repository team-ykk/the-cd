require 'test_helper'

class Admins::ContactRepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_contact_replies_new_url
    assert_response :success
  end

end
