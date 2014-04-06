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

  def new
    @user = User.new
  end

  def index
   @users = User.all
  end

private

  def signed_in_user
   unless signed_in?
    store_location
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
   end
  end

  def correct_user
   @user = User.find(params[:id])
   redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
   redirect_to(root_path) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation)
  end

end


