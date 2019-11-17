require 'test_helper'

class Publics::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_contacts_new_url
    assert_response :success
  end

end
