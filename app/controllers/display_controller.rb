class DisplayController < ApplicationController
  before_filter :check_for_user
  def index
    headers['Access-Control-Allow-Origin'] = "*"
    headers['X-Frame-Options'] = 'ALLOW-FROM http://labs.bradsotherbrain.com:8600/'
  end
end
