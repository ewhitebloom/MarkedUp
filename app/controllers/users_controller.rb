class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def address
    location = [current_user.latitude, current_user.longitude]
    respond_to do |format|
      format.html
      format.json { render json: location.as_json}
    end
  end

  def index
    @users = User.near([current_user.latitude, current_user.longitude],1)
  end
end


