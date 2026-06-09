class UsersController < ApplicationController
  def index
        @users = User.includes(:profile).where.not(id: current_user.id)

  end

  def show
        @user = User.find(params[:id])
    @profile = @user.profile
    @posts = @user.posts.order(created_at: :desc)
  end
end
