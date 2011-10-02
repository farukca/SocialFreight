class LoadingsController < ApplicationController
  # GET /loadings
  # GET /loadings.json
  def index
    @loadings = Loading.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loadings }
    end
  end

  # GET /loadings/1
  # GET /loadings/1.json
  def show
    @loading = Loading.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loading }
    end
  end

  # GET /loadings/new
  # GET /loadings/new.json
  def new
    @loading = Loading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loading }
    end
  end

  # GET /loadings/1/edit
  def edit
    @loading = Loading.find(params[:id])
  end

  # POST /loadings
  # POST /loadings.json
  def create
    @loading = Loading.new(params[:loading])

    respond_to do |format|
      if @loading.save
        format.html { redirect_to @loading, notice: 'Loading was successfully created.' }
        format.json { render json: @loading, status: :created, location: @loading }
      else
        format.html { render action: "new" }
        format.json { render json: @loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loadings/1
  # PUT /loadings/1.json
  def update
    @loading = Loading.find(params[:id])

    respond_to do |format|
      if @loading.update_attributes(params[:loading])
        format.html { redirect_to @loading, notice: 'Loading was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loadings/1
  # DELETE /loadings/1.json
  def destroy
    @loading = Loading.find(params[:id])
    @loading.destroy

    respond_to do |format|
      format.html { redirect_to loadings_url }
      format.json { head :ok }
    end
  end
end
