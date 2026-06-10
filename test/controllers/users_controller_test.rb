require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  setup do
  sign_in users(:one)
  end

 test "should get show" do
  get user_url(users(:one))
  assert_response :success
  end
end
