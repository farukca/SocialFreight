class PatronsController < ApplicationController

  before_filter :require_login, except: [:new, :create]

  def index
    @patrons = Patron.all

    respond_to do |format|
      format.html { render layout: "admin" }
      format.json { render json: @patrons }
    end
  end

  def show
    @patron = Patron.find(params[:id])

    respond_to do |format|
      format.html { render layout: "admin" }
      format.json { render json: @patron }
    end
  end

  def new
    @patron = Patron.new

    respond_to do |format|
      format.html { render layout: "guest" }
      format.json { render json: @bank }
    end
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def create
    @patron = Patron.new(params[:patron])
    @country = Country.find(params[:patron][:country_id]) unless params[:patron][:country_id].blank?
    @patron.language = @country.language
    @patron.locale   = @country.locale
    @patron.mail_encoding = @country.mail_encoding
    @patron.time_zone = @country.time_zone

    respond_to do |format|
      if @patron.save
        #format.html { redirect_to @patron, notice: 'Patron was successfully created.' }
        format.html { render 'check_mail', notice: 'Patron was successfully created.', layout: 'guest' }
        format.json { render json: @patron, status: :created, location: @patron }
      else
        format.html { render action: "new" }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @patron = Patron.find(params[:id])

    respond_to do |format|
      if @patron.update_attributes(params[:patron])
        format.html { redirect_to @patron, notice: 'Patron was successfully updated.', layout: 'admin' }
        format.json { head :ok }
      else
        format.html { render action: "edit", layout: 'admin' }
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
