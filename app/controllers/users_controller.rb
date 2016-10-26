class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.all.sort_by &:name
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.student = true
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if params[:role] == "1"
      @user.student = true
      @user.teacher = false
      @user.admin = false
    elsif params[:role] == "2"
      @user.student = false
      @user.teacher = true
      @user.admin = false
    elsif params[:role] == "3"
      @user.student = false
      @user.teacher = false
      @user.admin = true
    end     
    if @user.update_attributes(user_params)        
      flash[:success] = "Profile updated"
      if current_user.admin?
        redirect_to users_path
      elsif
        redirect_to @user
      end
    else
      render 'edit'
    end
  end

  def teacher?
    current_user.teacher
  end
###ONLY FOR ADMINS##############
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
################################
  private

    def user_params
      if current_user
        if current_user.admin?
          params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :avatar)
        else
        params.require(:user).permit(:name, :email, :password,  :password_confirmation, :avatar)
        end
      else
        params.require(:user).permit(:name, :email, :password,  :password_confirmation, :avatar)
      end
    end
    # Before filters

   # Confirms a logged-in user.
   def logged_in_user
     unless logged_in?
        store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end
   # Confirms the correct user.
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)||current_user.admin?   
   end
   # Confirms an admin user.
   def admin_user
     redirect_to(root_url) unless current_user.admin?
   end
end