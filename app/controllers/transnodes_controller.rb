class TransnodesController < ApplicationController

  before_filter :require_login

  def new
    @position   = Position.find(params[:position_id]) #if params[:position_id] #her daim pozisyon olmalı
    @transnode  = @position.transnodes.build(params[:transnode])
    @transnode.fromwhere  = params[:fromwhere] if params[:fromwhere]
    if params[:trans_method]
      @transnode.trans_method = params[:trans_method]
    else
      @transnode.trans_method = @position.operation
    end
  end

  def edit
    @transnode = Transnode.find(params[:id])
  end

  def create
    @position   = Position.find(params[:position_id])
    @transnode  = @position.transnodes.build(params[:transnode])
    fromwhere   = params[:transnode][:fromwhere] if params[:transnode][:fromwhere]
    
    respond_to do |format|
      if @transnode.save
        if fromwhere == 'position'
          format.html { redirect_to new_loading_path(:position_id => @position.id), notice: 'New Node added successfully.' }
        else
          format.html { redirect_to @position, notice: 'New Node added successfully.' }
        end
        format.json { render json: @transnode, status: :created, location: @transnode }
      else
        format.html { redirect_to @position, alert: 'Errors on creating transnode.' }
        format.json { render json: @transnode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transnode = Transnode.find(params[:id])

    respond_to do |format|
      if @transnode.update_attributes(params[:transnode])
        format.html { redirect_to @transnode.position, notice: 'Transnode was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @transnode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transnode = Transnode.find(params[:id])
    @position   = @transnode.position
    @transnode.destroy

    respond_to do |format|
      format.html { redirect_to @position, notice: 'Transnode deleted.' }
      format.json { head :ok }
    end
  end

end
