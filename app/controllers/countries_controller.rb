class CountriesController < ApplicationController

  #before_filter :require_login

  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country }
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def index
    @countries = Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @countries }
    end
  end

  def show
    @country = Country.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country }
    end
  end

  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country was successfully created.' }
        format.json { render json: @country, status: :created, location: @country }
      else
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end
end
