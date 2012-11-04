class NicksController < ApplicationController

  before_filter :require_login

  def index
    
    @nicks = Nick.where(nicknamed_type: "Position")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nicks.map(&:name) }
    end

  end

  def show

  	nick = Nick.find_by_name(params[:id])
  	redirect_to nick.nicknamed if nick

  end
end
