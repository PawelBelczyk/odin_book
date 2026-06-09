class FollowRequestsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])

    @follow_request = current_user.sent_follow_requests.build(
      followed: @user,
      status: "pending"
    )

    if @follow_request.save
      redirect_to users_path, notice: "Follow request sent."
    else
      redirect_to users_path, alert: "Could not send follow request."
    end
  end

  def update
    @follow_request = current_user.received_follow_requests.find(params[:id])

    if @follow_request.update(status: "accepted")
      redirect_to profile_path, notice: "Follow request accepted."
    else
      redirect_to profile_path, alert: "Could not accept follow request."
    end
  end
end