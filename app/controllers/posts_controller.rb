class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def create
  end

  def new
    @post = Post.new
  end

  def destroy
  end

end
