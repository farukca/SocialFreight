class TransplanController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :select_loads, :plan_info, :trans_plan, :trans_info

  def show
    
    @user   = current_user
    @search   = Search.new

    case step
      when :select_loads
        session[:loading_ids]=[]
      	@loadings = Loading.find(params[:loading_ids]) if params[:loading_ids]
        session[:loading_ids][0] = params[:loading_ids] if params[:loading_ids]
        @position = Position.new
        if @loadings
          @search.operation = @loadings.operation
          @search.direction = @loadings.direction
        end
      when :plan_info

        @position = current_patron.positions.build(params[:position])
        debugger
        #loading_ids[] = session[:loading_ids]
        strRef = ""
        @loadings = Loading.find(session[:loading_ids])
        @loadings.each do |loading|
          strRef = strRef + ", #{loading.id}"
          @position.operation = loading.operation
          @position.direction = loading.direction
          @position.incoterm  = loading.incoterm
          @position.paid_at   = loading.paid_at
        end
        flash[:notice] = "Added Loadings #{strRef}!"
      when :trans_plan
        #@transnode = Transnode.new
      when :trans_info
        @transnode = Transnode.new
    end
    render_wizard
      
  end
  
  def update

    case step
      when :select_loads
     
        skip_step

      when :plan_info
	    	@position = current_patron.positions.build(params[:position])
        @patron.update_attributes(params[:position])
        #render_wizard @position
    end
    render_wizard
  end
end
