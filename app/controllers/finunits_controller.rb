class FinunitsController < ApplicationController

  before_filter :require_login

  def index
    if params[:data][:q]
       q = "%#{params[:data][:q]}%"
       @finunits = Finunit.where("lower(name) like ? and patron_id = ?", q, current_patron.id).limit(10)
    else
      @finunits = Finunit.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finunits.map(&:token_inputs) }
    end
  end

  def show
    @finunit = Finunit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finunit }
    end
  end

  def new
    @finunit = Finunit.new
    @finunit.unit_type = params[:unit_type] if params[:unit_type]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finunit }
    end
  end

  def edit
    @finunit = Finunit.find(params[:id])
  end

  def create
    @finunit = Finunit.new(params[:finunit])
    @finunit.patron_id = current_patron.id
    @finunit.patron_token = current_patron.token
    #@finunit.person_id = current_user.id

    respond_to do |format|
      if @finunit.save
        format.html { redirect_to @finunit, notice: 'Finunit was successfully created.' }
        format.json { render json: @finunit, status: :created, location: @finunit }
      else
        format.html { render action: "new" }
        format.json { render json: @finunit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @finunit = Finunit.find(params[:id])

    respond_to do |format|
      if @finunit.update_attributes(params[:finunit])
        format.html { redirect_to @finunit, notice: 'Finunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finunit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @finunit = Finunit.find(params[:id])
    @finunit.destroy

    respond_to do |format|
      format.html { redirect_to finunits_url }
      format.json { head :no_content }
    end
  end
end
