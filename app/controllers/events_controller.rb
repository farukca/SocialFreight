class EventsController < ApplicationController

  before_filter :require_login

  def index
  end

  def new
    @eventable = find_eventable
    @event = @eventable.events.new
    #@event.company_id = params[:company_id] if params[:company_id]  	
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.user_id = current_user.id
    @event.event_type = "event"

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event.eventable, notice: 'event was successfully created.' }
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

  private
  def find_eventable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
