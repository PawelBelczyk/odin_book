require "test_helper"

class FollowRequestTest < ActiveSupport::TestCase
  test "user can send follow request to another user" do
    follower = User.create!(email: "follower@example.com", password: "password")
    followed = User.create!(email: "followed@example.com", password: "password")

    request = FollowRequest.create!(
      follower: follower,
      followed: followed,
      status: "pending"
    )

    assert_equal follower, request.follower
    assert_equal followed, request.followed
  end
end