class SearchesController < ApplicationController

  before_filter :require_login

  def new
    @search = Search.new
    #@search.operation = params[:operation] if params[:operation]
    @search.model     = params[:model] if params[:model]
    @search.docdate1  = 1.month.ago
    @search.docdate2  = Date.today
  end

  def create
    @search = Search.new(params[:search])
    @search.user_id = current_user.id
    @search.session_loading_ids = session[:loading_ids] if session[:loading_ids]

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render nothing: true }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @search = Search.find(params[:id])
    @engine = ""
    case @search.model
      when "positions" 
        @search_results   = @search.positions.page(params[:page]).per(10)
      when "loadings"
        @search_results   = @search.loadings.page(params[:page]).per(10)
      when "reservations"
        @search_results   = @search.reservations.page(params[:page]).per(10)
      when "companies"
        if @search.searched
          @search_results   = Company.search(@search.reference, params[:page])
        else
          @search_results   = @search.companies.page(params[:page]).per(10)
        end
      when "contacts"
        @search_results   = @search.contacts.page(params[:page]).per(10)
      when "transports"
        @search_results   = @search.transports.page(params[:page]).per(10)
      when "vehicles"
        @search_results   = @search.vehicles.page(params[:page]).per(10)
      when "wares"
        @engine = "assetim/"
        @search_results   = @search.wares#.page(params[:page]).per(10)
      when "tickets"
        @engine = "helpdesk/"
        @search_results   = @search.tickets#.page(params[:page]).per(10)
    end 
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @search_results }
    end
  end

  def planning

    @search = Search.new
    #@search.operation = params[:operation] if params[:operation]

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