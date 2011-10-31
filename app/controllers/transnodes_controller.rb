class TransnodesController < ApplicationController

  before_filter :require_login

  def new
    @position   = Position.find_by_slug!(params[:position_id]) if params[:position_id]
    @transnode  = @position.transnodes.build(params[:transnode])
  end

  def edit
    @transnode = Transnode.find(params[:id])
  end

  def create
    @position   = Position.find_by_slug!(params[:position_id])
    @transnode  = @position.transnodes.build(params[:transnode])

    respond_to do |format|
      if @transnode.save
        format.html { redirect_to @position, notice: 'New Node added successfully.' }
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
