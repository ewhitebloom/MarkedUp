class VotesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :json

  def create
    @vote = Vote.new(vote_params)
    @vote.vote = true
    @vote.save
    respond_to do |format|
      format.html { redirect_to '/posts'}
      format.json { render json: @vote }
    end
  end

  def vote_params
    { voter_id: current_user.id, voteable_id: params[:post_id], voteable_type: 'post' }
  end
end
