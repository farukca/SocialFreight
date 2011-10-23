class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_patron

  private
  def current_patron
    @current_patron ||= Patron.find(session[:patron_id]) if session[:patron_id]
  end

  def require_patron
    if !patron_user?
      session[:return_to_url] = request.url if Config.save_return_to_url
      self.send(Config.not_authenticated_action)
    end
  end

  protected
  def not_authenticated
    redirect_to root_path, :alert => "Please login first."
  end

  def patron_user?
    !!current_patron
  end

end
