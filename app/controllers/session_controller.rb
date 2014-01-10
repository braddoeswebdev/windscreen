class SessionController < ApplicationController
  skip_before_filter :check_for_user, :only => [:create]
  def create
    if user = User.find_by_username(params[:username]).authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in."
    else
      redirect_to root_path, :alert => "Invalid credentials."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out."
  end
end
