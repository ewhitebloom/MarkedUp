class VotesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json

  def create
    @vote = Vote.new
    @vote.voter = current_user
    @vote.vote = true
    @vote.voteable = Post.find(params[:post_id])
    @vote.save
    respond_to do |format|
      format.html { redirect_to '/list'}
      format.json { render json: @vote }
    end
  end
end
