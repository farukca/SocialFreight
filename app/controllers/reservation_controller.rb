class ReservationController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :load_info, :departure_info, :arrival_info, :load_detail

  def show
    
    @user   = current_user

    case step
      when :load_info
        @loading = current_patron.loadings.new
        @loading.operation = params[:operation]
        @loading.setup
        
      when :departure_info
		    @loading = current_patron.loadings.find(session[:wicked_loading_id])
        @departure = @loading.departures.new
        @departure.packages.build()

      when :arrival_info
        @loading = current_patron.loadings.find(session[:wicked_loading_id])
        @arrival = @loading.arrivals.new
        @arrival.packages.build()

      when :load_detail
        @loading = current_patron.loadings.find(session[:wicked_loading_id])

    end
    render_wizard
      
  end
  
  def update
    case step
      when :load_info
        @loading = current_patron.loadings.build(params[:loading])
        #@patron.update_attributes(params[:patron])
        @loading.patron_token = current_patron.token
        @loading.user_id = current_user.id
        #session[:wicked_loading_id] = 
        if @loading.save
          session[:wicked_loading_id] = @loading.id
          redirect_to_next(:departure_info)
        else
          render_wizard
        end
      when :departure_info
        @loading = current_patron.loadings.find(session[:wicked_loading_id])
        @departure = @loading.departures.build(params[:departure])
        if @departure.save
          redirect_to_next(:arrival_info)
        else
          debugger
          render_wizard
        end
      when :arrival_info
        @loading = current_patron.loadings.find(session[:wicked_loading_id])
        @arrival = @loading.arrivals.build(params[:arrival])
        if @arrival.save
          redirect_to_next(:load_detail)
        else
          render_wizard
        end
      when :load_detail
        @loading = current_patron.loadings.find(session[:wicked_loading_id])
        if @loading.update_attributes(params[:loading])
          session[:wicked_loading_id] = nil
          redirect_to @loading
        else
          render_wizard
        end
    end
    #render_wizard @loading
  end

end