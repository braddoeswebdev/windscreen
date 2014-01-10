class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_for_user
  helper_method :current_user, :meta

  def meta key
    Metum.where(:key => key).first_or_create(:value => "")
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
    @current_user
  end

  def check_for_user
    !!current_user
  end

  def check_for_author
    redirect_to root_path, :alert => "You aren't allowed to do that" unless current_user && !!current_user.author?
  end

  def check_for_operator
    redirect_to root_path, :alert => "You aren't allowed to do that" unless current_user && !!current_user.operator?
  end 

  def check_for_manager
    redirect_to root_path, :alert => "You aren't allowed to do that" unless current_user && !!current_user.manager?
  end

  def check_for_admin
    redirect_to root_path, :alert => "You aren't allowed to do that" unless current_user && !!current_user.admin?
  end

end
