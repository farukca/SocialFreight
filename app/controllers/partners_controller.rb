class PartnersController < ApplicationController
  before_filter :require_login

  def index
  end

  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partner }
    end
  end

  def new
    @partner = Partner.new
    @partner.company_id = params[:company_id] if params[:company_id]
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @company = Company.find(params[:partner][:company_id])  	
    @partner = @company.partners.build(params[:partner])
    @partner.user_id = current_user.id
    
    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner.company, notice: 'Partner was successfully created.' }
        format.json { render json: @partner, status: :created, location: @partner }
      else
        format.html { render action: "new" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @partner = Partner.find(params[:id])

    respond_to do |format|
      if @partner.update_attributes(params[:partner])
        format.html { redirect_to @partner.company, notice: 'partner was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end
end
