class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def address
    location = [current_user.latitude.to_f, current_user.longitude.to_f]
    respond_to do |format|
      format.html
      format.json { render json: location.as_json}
    end
  end

  def index
   @users = User.all
  end
end


