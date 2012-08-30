class TransplanController < ApplicationController
  include Wicked::Wizard

  before_filter :require_login

  steps :select_loads, :position_info, :trans_info#:plan_info, :trans_info

  def show
    
    case step

      when :select_loads

        session[:wicked_loading_ids]=[]
        session[:plan_operation] = nil
        session[:plan_direction] = nil
        @position = current_patron.positions.build(operation: current_operation)

        @loading = current_patron.loadings.find(params[:loading_id]) if params[:loading_id]
        
        if @loading
          session[:wicked_loading_ids] << @loading.id
          session[:plan_operation] = @loading.operation
          session[:plan_direction] = @loading.direction

          @position.operation   = session[:plan_operation]
          @position.direction   = session[:plan_direction]
          @position.loading_ids = session[:wicked_loading_ids]
        end

        @search = Search.new
        @search.operation     = session[:plan_operation] || current_operation

      when :position_info
        @position = current_patron.positions.build()
        @position.operation   = session[:plan_operation]
        @position.direction   = session[:plan_direction]
        @position.loading_ids = session[:wicked_loading_ids]

        @loadings = current_patron.loadings.find(session[:wicked_loading_ids])

      #when :plan_info
      #  @position = current_patron.positions.build(params[:position])
      #  @loadings = Loading.find(session[:loading_ids])
      #  #flash[:notice] = "Added Loadings #{strRef}!"
      when :trans_info
        @position = current_patron.positions.find(session[:wicked_position_id])
        @transport = @position.transports.build(trans_method: @position.operation)
    end
    render_wizard
  end
  
  def update

    case step
      when :select_loads

        #@loading = current_patron.loadings.find(session[:wicked_loading_ids])
        
        #@loading.each do |load|
          #Burada seçili yükleri kontrol etmek gerekebilir. Pozisyon id alanı boş mu gibi mesela
        #end
        #problemli bir kayıt olması durumunda, render_wizard ile tekrar aynı step render edilmeli, uyarı mesajı ile
        redirect_to_next(:position_info)

      when :position_info
        @position = current_patron.positions.build(params[:position])
        @position.loading_ids  = session[:wicked_loading_ids]
        
        @position.user_id      = current_user.id
        @position.branch_id    = current_user.branch_id
        @position.patron_token = current_patron.token

        if @position.save!
          session[:wicked_position_id] = @position.id
          redirect_to_next(:trans_info)
        else
          render_wizard
        end
        #debugger
        #options = { :id => :trans_info, :only_path  => true }
        #url_for(options)
        #render_step @next_step, options
        #skip_step 
        #redirect_to wizard_path(@next_step, :position => params[:position])

      #when :plan_info
      #  skip_step

      when :trans_info
        @transport = Transport.new(params[:transport])
        @transport.user_id = current_user.id
        if @transport.save!

          session[:wicked_loading_ids] = []
          session[:wicked_position_id] = nil
          session[:plan_operation]     = nil
          session[:plan_direction]     = nil
         
          redirect_to @transport.position
        else
          render_wizard
        end
          
    end
    #render_wizard
  end
end
