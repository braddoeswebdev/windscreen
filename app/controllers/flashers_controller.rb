class FlashersController < ApplicationController
  before_filter :check_for_manager
  # GET /flashers
  # GET /flashers.json
  def index
    @flashers = Flasher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flashers }
    end
  end

  # GET /flashers/1
  # GET /flashers/1.json
  def show
    @flasher = Flasher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flasher }
    end
  end

  # GET /flashers/new
  # GET /flashers/new.json
  def new
    @flasher = Flasher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flasher }
    end
  end

  # GET /flashers/1/edit
  def edit
    @flasher = Flasher.find(params[:id])
  end

  # POST /flashers
  # POST /flashers.json
  def create
    @flasher = Flasher.new(params[:flasher])

    respond_to do |format|
      if @flasher.save
        format.html { redirect_to @flasher, notice: 'Flasher was successfully created.' }
        format.json { render json: @flasher, status: :created, location: @flasher }
      else
        format.html { render action: "new" }
        format.json { render json: @flasher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flashers/1
  # PUT /flashers/1.json
  def update
    @flasher = Flasher.find(params[:id])

    respond_to do |format|
      if @flasher.update_attributes(params[:flasher])
        format.html { redirect_to @flasher, notice: 'Flasher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flasher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashers/1
  # DELETE /flashers/1.json
  def destroy
    @flasher = Flasher.find(params[:id])
    @flasher.destroy

    respond_to do |format|
      format.html { redirect_to flashers_url }
      format.json { head :no_content }
    end
  end
end
