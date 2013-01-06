class DeparturesController < ApplicationController

  before_filter :require_login

  def show
    @departure = Departure.find(params[:id])
    @marker = @departure.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @departure }
    end
  end

  def new
  	@loading = Loading.find(params[:loading_id])
    @departure = @loading.departures.build(params[:departure])
    @departure.country_id = @loading.load_coun if @loading.load_coun
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departure }
    end
  end

  def edit
    @departure = Departure.find(params[:id])
  end

  def create
  	@loading = Loading.find(params[:departure][:loading_id])
    @departure = @loading.departures.build(params[:departure])
    #@departure.user_id = current_user.id
    
    respond_to do |format|
      if @departure.save
        format.html { redirect_to @departure.loading, notice: 'Departure was successfully created.' }
        format.json { render json: @departure, status: :created, location: @departure }
      else
        format.html { render action: "new" }
        format.json { render json: @departure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @departure = Departure.find(params[:id])

    respond_to do |format|
      if @departure.update_attributes(params[:departure])
        format.html { redirect_to @departure.loading, notice: 'Departure was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @departure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @departure = Departure.find(params[:id])
    @departure.destroy

    respond_to do |format|
      format.html { redirect_to @departure.loading }
      format.json { head :ok }
    end
  end
end
