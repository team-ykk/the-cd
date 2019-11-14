require 'test_helper'

class Publics::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_addresses_new_url
    assert_response :success
  end

end
