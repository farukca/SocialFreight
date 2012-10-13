class SearchesController < ApplicationController

  before_filter :require_login

  def new
    @search = Search.new
    @search.operation = params[:operation] if params[:operation]
    @search.model     = params[:model] if params[:model]
  end

  def create
    @search = Search.new(params[:search])
    @search.patron_id = current_patron.id
    @search.user_id = current_user.id
    @search.patron_token = current_patron.token
    @search.session_loading_ids = session[:loading_ids] if session[:loading_ids]

    @search.save!
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def planning

    @search = Search.new
    @search.operation = params[:operation] if params[:operation]
    @search.patron_id = current_patron.id
    @search.patron_token = current_patron.token

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def update
    @search = Search.new(params[:search])
    @search.patron_id = current_patron.id
    @search.patron_token = current_patron.token
    @search.user_id = current_user.id

    @search.save!
    redirect_to @search
  end

end
