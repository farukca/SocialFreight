class PaybackController < ApplicationController

  include Wicked::Wizard

  before_filter :require_login

  steps :select_staff, :work_list, :payoff_info

  def show
    
    case step

      when :select_staff
      	@payoff = Payoff.new

      when :work_list
      	@staff_id = session[:wicked_payback_staff_id]
      	@staff_id = 1
      	@person = People.find(@staff_id)
      	#TODO burada staff'ı people tablosundan kontrol etmeli, sürücü mü yoksa gümrük personeli mi yoksa diğer mi
      	#@transports = current_patron.transports.where(:driver_id => @staff_id)
      	@transports = Transport.where(:driver_id => @staff_id)
      	
    end

    render_wizard
  end


  def update
    
    case step

      when :select_staff
      	@staff_id = params[:payoff][:staff_id]
      	session[:wicked_payback_staff_id] = @staff_id
      	skip_step
    end

    render_wizard
  end


end
