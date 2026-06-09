class FollowRequest < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :status, presence: true
  validates :follower_id, uniqueness: {scope: :followed_id}

  def accepted?
  status == "accepted"
  end
end
