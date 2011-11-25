class CitiesController < ApplicationController

  before_filter :require_login

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
    @cities = City.where(:name => /#{params[:q]}/i).limit(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cities.map(&:token_inputs) }
    end

  end

  def show
    @city = City.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @city }
    end
  end

  def create
    @country = Country.find_by_slug(params[:country_id])
    @city    = @country.cities.create!(params[:city])
    redirect_to country_path(@country)
  end

end
