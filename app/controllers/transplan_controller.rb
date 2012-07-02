class TransplanController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :select_loads, :plan_info, :trans_info

  def show
    
    case step
      when :select_loads
        session[:loading_ids]=[]
      	@loadings = Loading.find(params[:loading_ids]) if params[:loading_ids]
        
        if @loadings
          session[:loading_ids][0] = @loadings.id
          session[:plan_operation] = @loadings.operation
          session[:plan_direction] = @loadings.direction
        end

        @position = Position.new
      when :plan_info

        @position = current_patron.positions.build(params[:position])

        @loadings = Loading.find(session[:loading_ids])
        #flash[:notice] = "Added Loadings #{strRef}!"
      when :trans_info
        @position = current_patron.positions.build()
        @position.operation = session[:plan_operation]
        @position.direction = session[:plan_direction]

        @transport = @position.transports.build(trans_method: @position.operation)
    end

    @search = Search.new
    @search.operation = session[:plan_operation]
    @search.direction = session[:plan_direction]
 
    render_wizard
      
  end
  
  def update

    case step
      when :select_loads
        skip_step

      when :plan_info
        skip_step

      when :trans_info
        @position = current_patron.positions.build(params[:position])
        @position.user_id      = current_user.id
        @position.branch_id    = current_user.branch_id
        @position.patron_token = current_patron.token
        @position.loading_ids  = session[:loading_ids]
        @position.save!
        session[:loading_ids] = []
        redirect_to @position
    end
    render_wizard
  end
end
