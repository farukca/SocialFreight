class TransroutesController < ApplicationController

  before_filter :require_login

  def new
    @transport  = Transport.find(params[:transport_id])
    @transroute = @transport.transroutes.new
  end  

  def edit
    @transroute = Transroute.find(params[:id])
  end

  def create
    @transport   = Transport.find(params[:transroute][:transport_id])
    @transroute  = @transport.transroutes.build(params[:transroute])

    respond_to do |format|
      if @transroute.save
        format.html { redirect_to @transport, notice: 'New route added successfully.' }
        format.json { render json: @transroute, status: :created, location: @transroute }
      else
        format.html { redirect_to @transport, alert: 'Errors on creating transroute.' }
        format.json { render json: @transroute.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transroute = Transroute.find(params[:id])

    respond_to do |format|
      if @transroute.update_attributes(params[:transroute])
        format.html { redirect_to @transroute.transport, notice: 'Transroute was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transroute.errors, status: :unprocessable_entity }
      end
    end
  end

end
