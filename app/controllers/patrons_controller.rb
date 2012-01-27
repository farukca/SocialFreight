class PatronsController < ApplicationController

  before_filter :require_login
  skip_before_filter :require_login, :only => [:new, :create]
  #layout 'guest', :only => :new

  def index
    @patrons = Patron.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patrons }
    end
  end

  def show
    @patron = Patron.find_by_code(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patron }
    end
  end

  def new
    @patron = Patron.new
    render :layout => 'guest' unless current_user
  end

  def edit
    @patron = Patron.find_by_code(params[:id])
  end

  def create
    @patron = Patron.new(params[:patron])

    respond_to do |format|
      if @patron.save
        #format.html { redirect_to @patron, notice: 'Patron was successfully created.' }
        format.html { render 'check_mail', notice: 'Patron was successfully created.' }
        format.json { render json: @patron, status: :created, location: @patron }
      else
        format.html { render action: "new" }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @patron = Patron.find_by_code(params[:id])

    respond_to do |format|
      if @patron.update_attributes(params[:patron])
        format.html { redirect_to @patron, notice: 'Patron was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patron = Patron.find(params[:id])
    @patron.destroy

    respond_to do |format|
      format.html { redirect_to patrons_url }
      format.json { head :ok }
    end
  end
end
