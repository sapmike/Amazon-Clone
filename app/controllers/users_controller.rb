class UsersController < ApplicationController

  def new
    @users = User.new
  end



  def create
    @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to '/'
    flash[:notice] = "Account successfully created"
  else
    redirect_to '/signup'
    flash[:alert] = "Invalid data in one or more fields"
    end
  end


private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
