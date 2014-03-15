class DisplayController < ApplicationController
  before_filter :check_for_user
  def index
    headers['Access-Control-Allow-Origin'] = "*"
    headers['X-Frame-Options'] = "ALLOW-FROM http://#{ROOT_URL}"
  end
end
