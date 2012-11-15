class CompaniesController < ApplicationController
  
  before_filter :require_login
  before_filter(:only => [:home]) { |c| c.set_tab "companynavigator" }
  
  def home
  end
  
  def index
    if params[:q]
       q = "%#{params[:q]}%"
       @companies = Company.where("lower(name) like ?", q).order(:name).limit(10)
    else
       if params[:id]
         @companies = Company.find_all_by_id(params[:id])
       else
         @companies = Company.latest.limit(10)
       end
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
      @company = Company.find(params[:id])
      @marker = @company.to_gmaps4rails
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company.map(&:token_inputs) }
    end
  end

  def new
    @company = Company.new(params[:company])
    @company.contacts.build(user_id: current_user.id)
    
    respond_to do |format|
      if params[:nolayout]
        format.html { render partial: 'modal_form', locals: { company: @company } }
      else
        format.html # new.html.erb
      end
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    @company.user_id = current_user.id
    #params[:company][:contacts_attributes][0][:user_id] = current_user.id
    
    respond_to do |format|
      if @company.save
        flash[:notice] = "Company was successfully created."
        format.html { redirect_to @company }
        format.js
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = Company.find(params[:id])

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

  #def destroy
  #  @company = Company.find(params[:id])
  #  @company.destroy

  #  respond_to do |format|
  #    format.html { redirect_to companies_url }
  #    format.json { head :ok }
  #  end
  #end

end
