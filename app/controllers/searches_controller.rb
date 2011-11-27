class SearchesController < ApplicationController

  before_filter :require_login

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(params[:search])
    @search.patron_id = current_patron.id
    @search.patron_token = current_patron.token

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

end
