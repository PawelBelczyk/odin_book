require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get profiles_edit_url
    assert_response :success
  end

test "should get update" do
  patch profile_url, params: {
    profile: {
      name: "Test User",
      bio: "Test bio",
      location: "Rzeszów"
    }
  }

  assert_redirected_to profile_path
  end

  setup do
  sign_in users(:one)
  end
end
