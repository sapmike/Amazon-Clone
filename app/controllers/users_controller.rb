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


  def edit
    @user = User.find(params[:id])
  end


  def update_password
   @user = current_user
   @user.update(update_pass_params)
   if @user.save
     flash[:notice] = "Password successfully updated"
     redirect_to edit_user_path
   else
     flash[:alert] = "Password was not updated"
     redirect_to edit_user_path
   end
  end


  def destroy
   @user = User.find(params[:id])
   @user.destroy
   flash[:notice] = "Account successfully deleted"
   redirect_to '/'
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def update_pass_params
    params.permit(:password, :password_confirmation)
  end
end
