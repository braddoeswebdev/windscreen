class WelcomeController < ApplicationController
  skip_before_filter :check_for_user, :only => [:index]
  def index
  end
  
  def noctrl
    render :layout => false
  end
  
  def noscreen
    render :layout => false
  end
end
