class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to root_path, notice: "Comment created."
    else
      redirect_to root_path, alert: "Comment cannot be empty."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end