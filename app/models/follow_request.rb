class FollowRequest < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :status, presence: true
  validates :follower_id, uniqueness: {scope: :followed_id}

  def accepted?
  status == "accepted"
  end


  def reject
   @follow_request = current_user.received_follow_requests.find(params  [:id])

   if @follow_request.update(status: "rejected")
    redirect_to profile_path, notice: "Follow request rejected."
    else
    redirect_to profile_path, alert: "Could not reject follow request."
    end
  end
end
