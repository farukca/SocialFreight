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

end
