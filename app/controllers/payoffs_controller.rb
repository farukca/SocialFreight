class PayoffsController < ApplicationController

  before_filter :require_login

  def index
    @payoffs = Payoff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payoffs }
    end
  end

  def show
    @payoff = Payoff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payoff }
    end
  end

  # GET /payoffs/new
  # GET /payoffs/new.json
  def new

    @payoff = Payoff.new
    @payoff.payoff_date = Date.today
    unless params[:transport_id].blank?
      @transport = Transport.find(params[:transport_id])
      @payoff.departure_date = @transport.departure_date
      @payoff.arrival_date   = @transport.arrival_date
      @payoff.staff_id       = @transport.driver_id
      @payoff.vehicle        = @transport.vessel
      @payoff.truck          = @transport.truck
      @payoff.departure_place = "#{@transport.dep_country.name} #{@transport.dep_city.name}"
      @payoff.arrival_place  =  "#{@transport.arv_country.name} #{@transport.arv_city.name}"
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payoff }
    end
  end

  # GET /payoffs/1/edit
  def edit
    @payoff = Payoff.find(params[:id])
  end

  # POST /payoffs
  # POST /payoffs.json
  def create
    @payoff = Payoff.new(params[:payoff])
    @payoff.user_id = current_user.id
    @payoff.patron_id = current_patron.id
    @payoff.payoff_type = "S"
    @payoff.name = "SF-00541"

    respond_to do |format|
      if @payoff.save
        format.html { redirect_to @payoff, notice: 'Payoff was successfully created.' }
        format.json { render json: @payoff, status: :created, location: @payoff }
      else
        format.html { render action: "new" }
        format.json { render json: @payoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payoffs/1
  # PUT /payoffs/1.json
  def update
    @payoff = Payoff.find(params[:id])

    respond_to do |format|
      if @payoff.update_attributes(params[:payoff])
        format.html { redirect_to @payoff, notice: 'Payoff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payoffs/1
  # DELETE /payoffs/1.json
  def destroy
    @payoff = Payoff.find(params[:id])
    @payoff.destroy

    respond_to do |format|
      format.html { redirect_to payoffs_url }
      format.json { head :no_content }
    end
  end
end
