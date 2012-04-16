class FindocsController < ApplicationController
  before_filter :require_login
  #before_filter {set_current_tab{"financenavigator"}}, :only => [:index]
  before_filter { |c| c.set_tab "financenavigator" }, :only => [:index]

  
  def index
    @findocs = Findoc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @findocs }
    end
  end

  def show
    @findoc = Findoc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @findoc }
    end
  end

  def new
    @findoc = Findoc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @findoc }
    end
  end

  # GET /findocs/1/edit
  def edit
    @findoc = Findoc.find(params[:id])
  end

  # POST /findocs
  # POST /findocs.json
  def create
    @findoc = Findoc.new(params[:findoc])
    @findoc.user_id = current_user.id
    @findoc.patron_id = current_patron.id
    @findoc.patron_token = current_patron.token

    respond_to do |format|
      if @findoc.save
        format.html { redirect_to @findoc, notice: 'Findoc was successfully created.' }
        format.json { render json: @findoc, status: :created, location: @findoc }
      else
        format.html { render action: "new" }
        format.json { render json: @findoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /findocs/1
  # PUT /findocs/1.json
  def update
    @findoc = Findoc.find(params[:id])

    respond_to do |format|
      if @findoc.update_attributes(params[:findoc])
        format.html { redirect_to @findoc, notice: 'Findoc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @findoc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /findocs/1
  # DELETE /findocs/1.json
  def destroy
    @findoc = Findoc.find(params[:id])
    @findoc.destroy

    respond_to do |format|
      format.html { redirect_to findocs_url }
      format.json { head :no_content }
    end
  end
end
