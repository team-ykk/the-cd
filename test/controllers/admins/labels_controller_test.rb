require 'test_helper'

class Admins::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_labels_new_url
    assert_response :success
  end

end
