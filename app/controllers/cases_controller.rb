class CasesController < ApplicationController

  before_filter :require_login

  def index
  end

  def new
    @case = Case.new
    @case.company_id = params[:company_id] if params[:company_id]  	
  end

  def edit
  	@case = Case.find(params[:id])
  end

  def create
    @case = current_user.cases.build(params[:case])
    @case.patron_id    = current_patron.id
    #@case.patron_token = current_patron.token
    
    respond_to do |format|
      if @case.save
        format.html { redirect_to @case.company, notice: 'Case was successfully created.' }
        format.json { render json: @case, status: :created, location: @case }
      else
        format.html { render action: "new" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @case = Case.find(params[:id])

    respond_to do |format|
      if @case.update_attributes(params[:case])
        format.html { redirect_to @case.company, notice: 'Case was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

end
