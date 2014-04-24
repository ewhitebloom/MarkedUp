class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @comment.post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
