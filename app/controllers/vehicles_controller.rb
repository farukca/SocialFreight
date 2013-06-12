class VehiclesController < ApplicationController

  before_filter :require_login
  before_filter(:only => [:index]) { |c| c.set_tab "fleetnavigator" }

  def home
  end
  
  def index
    if params[:q]
      strQ = params[:q].html_safe
      @vehicles = Vehicle.where(:code => /#{strQ}/i).limit(10)
    else
      @vehicles = Vehicle.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @vehicles.map(&:token_inputs) }
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehicle }
    end
  end

  def new
    @vehicle = Vehicle.new(vehicle_status: "active")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehicle }
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def create
    @vehicle = Vehicle.new(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :ok }
    end
  end

end
