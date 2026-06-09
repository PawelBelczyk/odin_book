class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :likes, comments: :user).order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created."
    else
      @posts = Post.includes(:user).order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end