class ControlController < ApplicationController
  before_filter :check_for_operator
  def index
  end

  def nav
    @user = current_user
    @url = params[:url]
    meta('lastURL').set @url
    meta('lastScreen').set 0
  end

  def raw
    @user = current_user
    @data = params[:data].gsub("'", "\\\\'")
    meta('lastURL').set(meta('defaultURL'))
    meta('lastScreen').set 0
  end
  
  def screen
    @user = current_user
    @screen = Screen.where(:name => params[:commit]).first
    meta('lastURL').set @screen.base
    meta('lastScreen').set @screen.id
  end

  def cue
      @user = current_user
      @op = params[:commit]
      if @op != "Move to Screen -->"
          @screen = Screen.where(:name => @op).first
      else
          @screen = Screen.find(meta('lastCue').value)
      end
      meta('cueURL').set(@screen.base + '?cue=1')
      meta('lastCue').set @screen.id
  end

  def refresh
  end

  def flasher
      @flasher = Flasher.find(params[:flasher_id])
  end
end
