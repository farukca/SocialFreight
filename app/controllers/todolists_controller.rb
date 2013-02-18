class TodolistsController < ApplicationController

  before_filter :require_login
  respond_to :js, :json

  def new
    @todolist = Todolist.new
  end

end
