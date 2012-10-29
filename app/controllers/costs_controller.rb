class CostsController < ApplicationController

  before_filter :require_login
  respond_to :html, :js, :json

  def index
    @costs = Cost.all
    respond_with @costs
  end

  def show
    @cost = Cost.find(params[:id])
    respond_with @cost
  end

  def new
    @costable = find_costable
    @cost     = @costable.costs.build()
    #TODO her masraf bir payoff ile ilişkili olmalı, masraf veya avans vermeden önce payoff oluşmalı
    @cost.costable_reference = @costable.to_s
    @cost.operation          = @costable.operation if @costable.respond_to?("operation")
    respond_with @cost
  end

  def edit
    @cost = Cost.find(params[:id])
    respond_with @cost
  end

  def create
    #@costable = find_costable
    #@cost = @costable.costs.build(params[:cost])
    @cost = Cost.new(params[:cost])
    @cost.user_id  = current_user.id
    @cost.cost_source = @cost.operation if @cost.cost_source.blank?

    @cost.save!
    respond_with @cost, :success => "Cost saved successfully"
  end

  def update
    @cost = Cost.find(params[:id])

    respond_to do |format|
      if @cost.update_attributes(params[:cost])
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def find_costable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
