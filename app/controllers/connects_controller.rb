class ConnectsController < ApplicationController

  def new

  	@connect = Connect.new
    @connect.position_id = params[:position_id]
    @connect.loading_id  = params[:loading_id]
    @connect.user_id     = current_user.id

    respond_to do |format|
      if @connect.create
        format.json { head :ok }
      else
        format.json { render json: { errors: @connect.errors.full_messages }, status: :unprocessable_entity }
      end
    end

  end

end
