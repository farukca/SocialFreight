class EventsController < ApplicationController

  before_filter :require_login

  def index
  end

  def new
    @event = Event.new
    @event.company_id = params[:company_id] if params[:company_id]  	
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event.company, notice: 'event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event.company, notice: 'event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

end
