class ActivitiesController < ApplicationController
  def index
  end

  def show
  	@activity = Activity.find(params[:id])
  	redirect_to @activity.target
  end
end
