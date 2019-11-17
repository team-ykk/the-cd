require 'test_helper'

class Admins::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_endusers_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_endusers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_endusers_edit_url
    assert_response :success
  end

end
