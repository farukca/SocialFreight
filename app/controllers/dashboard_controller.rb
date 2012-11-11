class DashboardController < ApplicationController

  before_filter :require_login

  before_filter(only: [:index]) { |c| c.set_tab "adminnavigator" }

  layout "admin"

  def index
  end

end
