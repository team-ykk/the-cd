require 'test_helper'

class Admins::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_artists_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_artists_create_url
    assert_response :success
  end

end
