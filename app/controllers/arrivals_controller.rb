class ArrivalsController < ApplicationController

  before_filter :require_login

  def show
    @arrival = Arrival.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arrival }
    end
  end

  def new
    @loading = Loading.find(params[:loading_id])
    @arrival = @loading.arrivals.build()
  end

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def create
    #@loading = Loading.find(params[:loading_id])
    @arrival = Arrival.build(params[:arrival])
    @arrival.patron_id    = current_patron.id
    @arrival.patron_token = current_patron.token
    
    respond_to do |format|
      if @arrival.save
        format.html { redirect_to @arrival, notice: 'Arrival was successfully created.' }
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
        format.html { redirect_to @arrival, notice: 'Arrival was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

end
