class NicksController < ApplicationController

  before_filter :require_login

  def show

  	nick = Nick.find_by_name(params[:id])
  	redirect_to nick.nicknamed if nick

  end
end
