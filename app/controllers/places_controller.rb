class PlacesController < ApplicationController
  
  before_filter :require_login

  def index
    if params[:q]
      strQ = params[:q].html_safe
      @places = Place.where(:name => /#{strQ}/i).limit(10)
    else
      @places = Place.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @places.map(&:token_inputs) }
    end
  end

  def show
    @place = Place.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place }
    end
  end

  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  def edit
    @place = Place.find_by_slug(params[:id])
  end

  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @place = Place.find_by_slug(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.find_by_slug(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :ok }
    end
  end
end
