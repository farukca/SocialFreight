class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_patron

  private
  def current_patron
    @current_patron ||= Patron.find(session[:patron_id]) if session[:patron_id]
  end 

  protected
  def not_authenticated
    redirect_to root_path, :alert => "Please login first."
  end

end
