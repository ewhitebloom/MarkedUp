class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
     respond_to do |format|
       format.html { redirect_to posts_path }
       format.json { render json: @post }
     end
    else
      render new_post_path
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:category, :body, :address)
  end

end
