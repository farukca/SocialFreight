class VesselsController < ApplicationController
  def index
    @vessels = Vessel.all
  end

  def new
    @vessel = Vessel.new
  end

  def edit
  end

  def show
    @vessel = Vessel.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @vessel }
    end
  end

  def create
    @vessel = Vessel.new(params[:vessel])

    respond_to do |format|
      if @vessel.save
        format.html { redirect_to @vessel, notice: 'Vessel successfully created.' }
        format.json { render json: @vessel, status: :created, location: @vessel }
      else
        format.html { render action: "new" }
        format.json { render json: @vessel.errors, status: :unprocessable_entity }
      end
    end
  end

end
