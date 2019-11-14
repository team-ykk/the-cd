require 'test_helper'

class Publics::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_carts_show_url
    assert_response :success
  end

end
