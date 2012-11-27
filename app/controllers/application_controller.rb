class ApplicationController < ActionController::Base
  protect_from_forgery

  around_filter :scope_current_patron
  around_filter :user_time_zone, if: :current_user
  before_filter :set_locale

  def follow_object(object)
    current_user.follow(object)
  end

  def set_tab(tab_id)
    session[:current_tab] = tab_id
  end
  
  def current_tab
    current_tab = "homenavigator"
    current_tab = session[:current_tab] if session[:current_tab]
    current_tab
  end
  helper_method :current_tab

  private
  def current_patron
    #@current_patron ||= Patron.find(session[:patron_id]) if session[:patron_id]
    @current_patron ||= Patron.find(current_user.patron_id) if current_user
  end
  helper_method :current_patron

  def scope_current_patron
    Patron.current_id = current_patron.id if current_patron
    yield
  ensure
    Patron.current_id = nil
  end

  def current_operation
    @current_operation = session[:current_operation] if session[:current_operation]
  end
  helper_method :current_operation

  def require_patron
    if !patron_user?
      session[:return_to_url] = request.url if Config.save_return_to_url
      self.send(Config.not_authenticated_action)
    end
  end

  def not_authenticated
    redirect_to root_path, :alert => "Please login first."
  end

  def patron_user?
    !!current_patron
  end

  layout proc { |controller|
    if controller.params[:nolayout]
      nil
    else
      current_patron ? "application" : "guest"
    end
  }

  def set_locale
    #locale = logged_in? ? current_user.locale : (params[:locale])
    if logged_in?
      locale = current_user.language
    end
    unless locale.present?
      locale = cookies[:socialfreight_locale]
    end
    unless locale.present?
      locale = Timeout::timeout(5) { Net::HTTP.get_response(URI.parse('http://api.hostip.info/country.php?ip=' + request.remote_ip )).body } rescue I18n.default_locale
      cookies[:socialfreight_locale] = locale
    end
    I18n.locale = (locale.present? && I18n.available_locales.include?(locale.to_sym)) ? locale : I18n.default_locale
  end
  
  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
    
end
