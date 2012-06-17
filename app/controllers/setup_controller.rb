class SetupController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login
  
  steps :set_address, :set_codes, :set_params, :set_branches, :set_users
  
  def show
    @patron = current_patron
    @user   = current_user
    case step
    when :set_params
      #counter_size = @patron.counters.size
      #if counter_size == 0
      ["air","sea","road","rail"].each { |o|
        counter = @patron.counters.find_or_initialize_by_operation_and_counter_type(o,"Loading")
        counter = @patron.counters.find_or_initialize_by_operation_and_counter_type(o,"Position")
      }
    when :set_branches

    end
    render_wizard
      
  end
  
  def update
    @patron = current_patron
    @patron.update_attributes(params[:patron])
    render_wizard @patron
  end
      
end
