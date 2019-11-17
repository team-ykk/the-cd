require 'test_helper'

class Admins::AddItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_add_items_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_add_items_index_url
    assert_response :success
  end

end
