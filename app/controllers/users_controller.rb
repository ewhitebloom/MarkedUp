class UsersController < ApplicationController
  before_filter :authenticate_user!

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :address]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

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
   @users = User.all
  end
end


