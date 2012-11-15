class SearchesController < ApplicationController

  before_filter :require_login

  def new
    @search = Search.new
    @search.operation = params[:operation] if params[:operation]
    @search.model     = params[:model] if params[:model]
  end

  def create
    @search = Search.new(params[:search])
    @search.user_id = current_user.id
    @search.session_loading_ids = session[:loading_ids] if session[:loading_ids]

    @search.save!
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    
    case @search.model 
      when "positions" 
        @positions = @search.positions.page(params[:page]).per(10)
      when "loadings"
        @loadings = @search.loadings.page(params[:page]).per(10)
      when "reservations"
        @reservations = @search.reservations.page(params[:page]).per(10)
    end 
  end

  def planning

    @search = Search.new
    @search.operation = params[:operation] if params[:operation]

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def update
    @search = Search.new(params[:search])
    @search.user_id = current_user.id

    @search.save!
    redirect_to @search
  end

end