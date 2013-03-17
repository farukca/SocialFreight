class TransportsController < ApplicationController
  
  before_filter :require_login

  def show
    @transport = Transport.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @transport }
    end
  end

  def new
    @position   = Position.find(params[:position_id]) #if params[:position_id] #her daim pozisyon olmalı
    @transport  = @position.transports.build(params[:transport])
    @transport.fromwhere  = params[:fromwhere] if params[:fromwhere]
    if params[:trans_method]
      @transport.trans_method = params[:trans_method]
    end
  end

  def edit
    @transport = Transport.find(params[:id])
  end

  def create
    @position   = Position.find(params[:transport][:position_id])
    @transport  = @position.transports.build(params[:transport])
    @transport.user_id = current_user.id

    fromwhere   = params[:transport][:fromwhere] if params[:transport][:fromwhere]
    
    respond_to do |format|
      if @transport.save
        format.html { redirect_to @transport, notice: 'New Node added successfully.' }
        format.json { render json: @transport, status: :created, location: @transport }
      else
        format.html { render action: "new" }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transport = Transport.find(params[:id])

    respond_to do |format|
      if @transport.update_attributes(params[:transport])
        format.html { redirect_to @transport.position, notice: 'Transport was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transport = Transport.find(params[:id])
    @position   = @transport.position
    @transport.destroy

    respond_to do |format|
      format.html { redirect_to @position, notice: 'Transport deleted.' }
      format.json { head :ok }
    end
  end
end
