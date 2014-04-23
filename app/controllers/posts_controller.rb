class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json

  def index
    @post = Post.new
    @comment = Comment.new
    nearby_posts = Post.search(params[:search]).near([current_user.latitude, current_user.longitude],1)
    nearby_posts_json = map_json(nearby_posts)
    respond_to do |format|
      format.html { @posts = nearby_posts.order(created_at: :desc) }
      format.json { render json: nearby_posts_json }
    end
  end

  def new
    @post = Post.new
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

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render 'index'
      flash[:notice] = 'Error in deleting your post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:category, :body, :address, :latitude, :longitude)
  end
end
