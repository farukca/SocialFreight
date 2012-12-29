class TransnodesController < ApplicationController

  before_filter :require_login

  def new
    @transport   = Transport.find(params[:transport_id]) #if params[:transport_id] #her daim pozisyon olmalı
    @transnode  = @transport.transnodes.build()
  end

  def edit
    @transnode = Transnode.find(params[:id])
  end

  def create
    @transport   = Transport.find(params[:transport_id])
    @transnode  = @transport.transnodes.build(params[:transnode])
    fromwhere   = params[:transnode][:fromwhere] if params[:transnode][:fromwhere]
    
    respond_to do |format|
      if @transnode.save
        if fromwhere == 'transport'
          format.html { redirect_to new_loading_path(:transport_id => @transport.id), notice: 'New Node added successfully.' }
        else
          format.html { redirect_to @transport, notice: 'New Node added successfully.' }
        end
        format.json { render json: @transnode, status: :created, location: @transnode }
      else
        format.html { redirect_to @transport, alert: 'Errors on creating transnode.' }
        format.json { render json: @transnode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transnode = Transnode.find(params[:id])

    respond_to do |format|
      if @transnode.update_attributes(params[:transnode])
        format.html { redirect_to @transnode.transport, notice: 'Transnode was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transnode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transnode = Transnode.find(params[:id])
    @transport   = @transnode.transport
    @transnode.destroy

    respond_to do |format|
      format.html { redirect_to @transport, notice: 'Transnode deleted.' }
      format.json { head :ok }
    end
  end

end
