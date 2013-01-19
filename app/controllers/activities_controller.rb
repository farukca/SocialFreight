class ActivitiesController < ApplicationController

  before_filter :require_login

  def index
  end

  def show
  	@activity = Activity.find(params[:id])
  	redirect_to @activity.target
  end
end
