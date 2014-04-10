class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
       redirect_to posts_path
    else
      render new_post_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
