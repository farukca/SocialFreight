class TodolistsController < ApplicationController

  before_filter :require_login
  respond_to :js, :json

  def new
    @todolist = Todolist.new
  end

  def create
    @todop = find_todop
    if @todop
      @todolist = @todop.todolists.build(params[:todolist])
    else
      @todolist = Todolist.new(params[:todolist])
    end
    @todolist.user_id  = current_user.id
    @todolist.save!
    respond_with @todolist, success: "Successfully saved todolist"
  end

  private
  def find_target
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
