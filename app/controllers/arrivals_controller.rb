class ArrivalsController < ApplicationController

  before_filter :require_login

  def show
    @arrival = Arrival.find(params[:id])
    @marker = @departure.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arrival }
    end
  end

  def new
    @loading = current_patron.loadings.find(params[:loading_id])
    @arrival = @loading.arrivals.build(params[:arrival])
    @arrival.country_id = @loading.unload_coun if @loading.unload_coun

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @departure }
    end
  end

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def create
    @loading = current_patron.loadings.find(params[:arrival][:loading_id])
    @arrival = @loading.arrivals.build(params[:arrival])
    #@arrival.user_id = current_user.id
    
    respond_to do |format|
      if @arrival.save
        format.html { redirect_to @arrival.loading, notice: 'Arrival was successfully created.' }
        format.json { render json: @arrival, status: :created, location: @arrival }
      else
        format.html { render action: "new" }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @arrival = Arrival.find(params[:id])

    respond_to do |format|
      if @arrival.update_attributes(params[:arrival])
        format.html { redirect_to @arrival.loading, notice: 'Arrival was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @arrival = Arrival.find(params[:id])
    @arrival.destroy

    respond_to do |format|
      format.html { redirect_to @arrival.loading }
      format.json { head :ok }
    end
  end
end
