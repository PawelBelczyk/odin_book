class ProfilesController < ApplicationController

  before_action :set_profile
  def show
    @posts = current_user.posts.order(created_at: :desc)
    @received_follow_requests = current_user.received_follow_requests.where(status: "pending")
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "profile updated"
    else
      render :edit, status: :unprocessable_entity
  
  end
end

  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile(name: current_user.email)
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :location)
  end
end
