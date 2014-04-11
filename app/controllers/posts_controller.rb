class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.json { render json: @post }
      end
    else
      respond_to do |format|
        format.html { render new_post_path }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:category, :body, :address, :latitude, :longitude)
  end

end
