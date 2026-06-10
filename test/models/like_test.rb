require "test_helper"

class LikeTest < ActiveSupport::TestCase
  test "user can like post only once" do
    user = User.create!(email: "like@example.com", password: "password")
    post = user.posts.create!(content: "Post")

    Like.create!(user: user, post: post)
    duplicate_like = Like.new(user: user, post: post)

    assert_not duplicate_like.valid?
  end
end