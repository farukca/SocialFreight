class NicksController < ApplicationController

  before_filter :require_login

  def show

  	nick = Nick.find_by_name_and_patron_id(params[:id], current_patron.id)
  	redirect_to nick.nicknamed if nick

  end
end
