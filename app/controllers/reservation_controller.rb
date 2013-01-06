class ReservationController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :load_info, :departure_info, :arrival_info, :load_detail

  def show
    
    @user   = current_user

    case step
      when :load_info

        operation = current_operation
        if operation.blank?
          session[:return_to_operation] = request.url
          redirect_to operations_path
        else
          @loading = Loading.new
          @loading.operation = params[:operation]
          @loading.setup
        end
      when :departure_info
		    @loading = Loading.find(session[:wicked_loading_id])
        @departure = @loading.departures.new
        @departure.country_id = @loading.load_coun if @loading.load_coun
        @departure.packages.build()

      when :arrival_info
        @loading = Loading.find(session[:wicked_loading_id])
        @arrival = @loading.arrivals.new
        @arrival.country_id = @loading.unload_coun if @loading.unload_coun
        @arrival.packages.build()

      when :load_detail
        @loading = Loading.find(session[:wicked_loading_id])

    end
    render_wizard
      
  end
  
  def update
    case step
      when :load_info
        @loading = Loading.new(params[:loading])
        @loading.user_id = current_user.id
        if @loading.save!
          session[:wicked_loading_id] = @loading.id
          redirect_to_next(:departure_info)
        else
          render_wizard
        end
      when :departure_info
        @loading = Loading.find(session[:wicked_loading_id])
        @departure = @loading.departures.build(params[:departure])
        if @departure.save
          redirect_to_next(:arrival_info)
        else
          render_wizard
        end
      when :arrival_info
        @loading = Loading.find(session[:wicked_loading_id])
        @arrival = @loading.arrivals.build(params[:arrival])
        if @arrival.save
          redirect_to_next(:load_detail)
        else
          render_wizard
        end
      when :load_detail
        @loading = Loading.find(session[:wicked_loading_id])
        if @loading.update_attributes(params[:loading])
          session[:wicked_loading_id] = nil
          redirect_to @loading
        else
          render_wizard
        end
    end
  end

end