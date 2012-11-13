class DashboardController < ApplicationController

  before_filter :require_login

  before_filter(only: [:index]) { |c| c.set_tab "adminnavigator" }

  def index
    render layout: "admin"
  end

  def calendar
  	@tasks = current_user.tasks

  	@tasks_by_date = @tasks.group_by(&:due_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

end
