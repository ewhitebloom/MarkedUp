class UsersController < ApplicationController
  before_filter :authenticate_user!

  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :address]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def create
   if signed_in?
     sign_out
   end
   @user = User.new(params[:user])
   if @user.save
     sign_in @user
     flash[:success] = "Welcome to MarkdUp!"
     redirect_to root_path
   else
     render 'new'
   end
  end

 def index
   @users = User.paginate(page: params[:page])
 end

 def edit
 end

 def update
   @user = User.find(params[:id])
   if @user.update_attributes(params[:user])
    flash[:success] = "Profile updated"
    sign_in @user
    redirect_to @user
  else
    render 'edit'
  end
 end

private

def signed_in_user
 unless signed_in?
  store_location
  redirect_to signin_path, notice: "Please sign in." unless signed_in?
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
end

end
