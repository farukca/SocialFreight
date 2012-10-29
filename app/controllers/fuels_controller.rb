class FuelsController < ApplicationController
  def new
   	@payoff = Payoff.find(params[:payoff_id]) if params[:payoff_id]
  	if @payoff
       @fuel = @payoff.fuels.build()
       @fuel.staff_id = @payoff.staff_id
  	else
  	   @fuel = Fuel.new
    end
    @fuel.process_date = Date.today
  end

  def edit
  end

  def show
  end

  def index
  end

  def create
    @fuel = Fuel.new(params[:fuel])
    @fuel.creater_id = current_user.id
    @fuel.updater_id = current_user.id

    respond_to do |format|
      if @fuel.save
        format.html { redirect_to @fuel.payoff, notice: 'Payment added successfully.' }
        #format.html { render 'detail', notice: 'Loading was successfully created.' }
        format.json { render json: @fuel, status: :created, location: @fuel }
      else
        format.html { render action: "new" }
        format.json { render json: @fuel.errors, status: :unprocessable_entity }
      end
    end

  end

end
