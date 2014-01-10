class ScreensController < ApplicationController
  before_filter :check_for_author, :except => [:index, :approve, :unapprove]
  before_filter :check_for_manager, :only => [:approve, :unapprove]
  # GET /screens
  def index
    @screens = Screen.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /screens/1
  def show
    @screen = Screen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /screens/new
  def new
    redirect_to root_path, :alert => "You can't do that." unless current_user.author?
    @screen = Screen.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /screens/1/edit
  def edit
    @screen = Screen.find(params[:id])
    if @screen.user == current_user || current_user.manager?
      respond_to do |format|
        format.html
      end
    else
      redirect_to screens_path, :warning => "You don't have permissions to edit someone else's screen."
    end
  end

  # POST /screens
  def create
    @screen = Screen.new(params[:screen])
    @screen.user = current_user

    if current_user.author?
      respond_to do |format|
        if @screen.save
          format.html { redirect_to @screen, notice: 'Screen was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    else
      redirect_to screens_path, :warning => "You don't have permissions to edit someone else's screen."
    end

  end

  # PUT /screens/1
  def update
    @screen = Screen.find(params[:id])
    if @screen.user == current_user || current_user.manager?
     respond_to do |format|
       if @screen.update_attributes(params[:screen])
         format.html { redirect_to @screen, notice: 'Screen was successfully updated.' }
       else
         format.html { render action: "edit" }
       end
      end
    else
      redirect_to screens_path, :warning => "You don't have permissions to edit someone else's screen."
    end
  end

  # DELETE /screens/1
  def destroy
    @screen = Screen.find(params[:id])
    @screen.destroy

    respond_to do |format|
      format.html { redirect_to screens_url }
    end
  end

  def approve
    if current_user.manager?
      @screen = Screen.find(params[:id])
      @screen.approved = true
      @screen.save
      redirect_to @screen, :notice => 'Approved screen.'
    else
      redirect_to @screen, :alert => "You aren't allowed to do that."
    end
  end

  def unapprove
    if current_user.manager?
      @screen = Screen.find(params[:id])
      @screen.approved = false
      @screen.save
      redirect_to @screen, :notice => 'Unapproved screen.'
    else
      redirect_to @screen, :alert => "You aren't allowed to do that."
    end
  end

  def enable
    @screen = Screen.find(params[:id])
    if current_user.manager? || @screen.user == current_user
      @screen.enabled = true
      @screen.save
      redirect_to @screen, :notice => 'Enabled screen.'
    else
      redirect_to @screen, :alert => "You aren't allowed to do that."
    end
  end

  def disable
    @screen = Screen.find(params[:id])
    if current_user.manager? || @screen.user == current_user
      @screen.enabled = false
      @screen.save
      redirect_to @screen, :notice => 'Disabled screen.'
    else
      redirect_to @screen, :alert => "You aren't allowed to do that."
    end
  end
end
