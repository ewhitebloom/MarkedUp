class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def create
    @post = Post.build(params[:post])
    if @post.save
     respond_to do |format|
       format.html { redirect_to(@post) }
       format.json { render json: @post }
     end
    else
      redirect_to root
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
