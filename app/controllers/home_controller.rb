class HomeController < ApplicationController
  
  layout 'guest_layout'

  def index
    if current_user && current_patron
       redirect_to user_path(current_user)
    end
  end

  def today
  end

end
