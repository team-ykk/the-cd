require 'test_helper'

class Admins::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_contacts_index_url
    assert_response :success
  end

end
