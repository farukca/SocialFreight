class CompaniesController < ApplicationController
  
  before_filter :require_login
  before_filter { |c| c.set_tab "companynavigator" }, :only => [:index]
  
  def index
    if params[:data] && params[:data][:q]
       q = "%#{params[:data][:q]}%"
       @companies = current_patron.companies.where("lower(name) like ?", q).limit(10)
    else
       @companies = current_patron.companies.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies.map(&:token_inputs) }
    end
  end

  def show
    if params[:lookup]
      @company = Company.find(params[:id])
    else
      @company = Company.find_by_slug(params[:id])
      @marker = @company.to_gmaps4rails
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def new
    @company = current_patron.companies.build(params[:company])
    @company.contacts.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find_by_slug(params[:id])
  end

  def create
    @company = current_patron.companies.build(params[:company])
    @company.patron_token = current_patron.token
    @company.user_id = current_user.id
    #params[:company][:contacts_attributes][0][:user_id] = current_user.id
    
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = Company.find_by_slug(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :ok }
    end
  end

end
