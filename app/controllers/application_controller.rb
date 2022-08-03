class ApplicationController < ActionController::Base
  include ApplicationHelper



  # I added this code below to handle a safe redirect when user inputs incorrect credentials
  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to root_url
  end


  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def require_user
    redirect_to '/login' unless current_user
  end
end
