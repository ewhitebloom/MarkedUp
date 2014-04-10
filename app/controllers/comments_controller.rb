class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = comment.new(comment_params)
    if @comment.save
     respond_to do |format|
       format.html { redirect_to comments_path }
       format.json { render json: @comment }
     end
    else
      render new_comment_path
    end
  end

  def new
    @comment = comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
