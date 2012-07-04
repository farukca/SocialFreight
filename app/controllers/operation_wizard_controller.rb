class OperationWizardController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :select_customer, :company_info

  def show
    
    @user   = current_user

    case step
      when :select_customer
        
      when :company_info
		@company = current_patron.companies.build
    end
    render_wizard
      
  end
  
  def update
    case step
      when :select_customer
        @company = current_patron.companies.find(params[:company_id]) if params[:company_id]
        if @company
          session[:wicked_loading_customer_id] = @company.id
          redirect_to reservation_path
        else
          skip_step
        end
      when :company_info
        @company = current_patron.companies.build(params[:company])
        @company.patron_token = current_patron.token
        @company.user_id = current_user.id
        @company.save!
        session[:wicked_loading_customer_id] = @company.id
        redirect_to reservation_path
    end
    #render_wizard @loading
  end

end
