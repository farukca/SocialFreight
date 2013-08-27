class PaybackController < ApplicationController

  include Wicked::Wizard

  before_filter :require_login

  steps :select_staff, :work_list, :payoff_info

  def show
    
    case step

      when :select_staff
      	@payoff = Payoff.new

      when :work_list
      	staff_id = session[:wicked_payback_staff_id]
    	  @person = Person.find(staff_id)
        @user   = @person.user || Nimbos::User.new
    	  @transports = Transport.where(:driver_id => staff_id)
    end

    render_wizard
  end


  def update
    
    case step

      when :select_staff
        if params[:payoff][:staff_id].blank?
          redirect_to payback_path(:select_staff)
        else
          session[:wicked_payback_staff_id] = params[:payoff][:staff_id]
      	  skip_step
        end
    end

    render_wizard
  end


end
