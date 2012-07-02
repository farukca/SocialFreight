class CitiesController < ApplicationController

  before_filter :require_login
  #caches_action :index

  def new
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @city }
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def index
    #@cities = City.where(:name => /#{params[:q]}/i).limit(10)
    @cities = City.where("country_id = ?", params[:country_id] )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities.map(&:token_inputs) }
    end

  end

  def show
    @city = City.find(params[:id])
    @marker  = @city.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  def create

    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city.country, notice: 'City was successfully created.' }
        format.json { render json: @city, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end

  end

end
