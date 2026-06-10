require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
  sign_in users(:one)
end
  
  test "should get index" do
    get posts_index_url
    assert_response :success
  end
end
