class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to root_path, notice: "Post liked."
    else
      redirect_to root_path, alert: "You already liked this post."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.user == current_user
      @like.destroy
      redirect_to root_path, notice: "Like removed."
    else
      redirect_to root_path, alert: "You cannot remove this like."
    end
  end
end