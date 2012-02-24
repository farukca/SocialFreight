class OperationsController < ApplicationController

  before_filter :require_login 
  before_filter :set_current_tab, :only => [:home]
  
  def index
    @operations = Operation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations }
    end
  end

  def show
    @operation = Operation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @operation }
    end
  end

  def home
    @operation = Operation.find(params[:id])
    @operation.patron_token = current_patron.token
    @search    = Search.new
    @search.operation = @operation.id

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @operation = Operation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
    end
  end

  def edit
    @operation = Operation.find(params[:id])
  end

  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.json { render json: @operation, status: :created, location: @operation }
      else
        format.html { render action: "new" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @operation = Operation.find(params[:id])

    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def set_current_tab
    set_tab(params[:id]+"navigator") if params[:id]
  end
  
end
