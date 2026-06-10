require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
  user = users(:one)

  mail = UserMailer.with(user: user).welcome

  assert_equal "Welcome", mail.subject
  assert_equal [user.email], mail.to
  end
end
