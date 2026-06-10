require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user can have many posts" do
    user = User.create!(email: "test@example.com", password: "password")
    post = user.posts.create!(content: "Hello Odin Book")

    assert_equal user, post.user
    assert_includes user.posts, post
  end

  test "user can have many comments" do
    user = User.create!(email: "test2@example.com", password: "password")
    post = user.posts.create!(content: "Post")
    comment = user.comments.create!(content: "Nice post", post: post)

    assert_equal user, comment.user
    assert_equal post, comment.post
  end
end