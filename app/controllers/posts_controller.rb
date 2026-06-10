class PostsController < ApplicationController
  def index
  visible_user_ids = current_user.following_ids + [current_user.id]

  @posts = Post.includes(:user, :likes, comments: :user)
               .where(user_id: visible_user_ids)
               .order(created_at: :desc)

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
    params.require(:post).permit(:content, :image)
  end
end