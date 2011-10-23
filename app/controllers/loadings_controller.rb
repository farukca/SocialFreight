class LoadingsController < ApplicationController

  before_filter :require_login

  def index
    @loadings = Loading.all

    respond_to do |format|
      format.html
      format.json { render json: @loadings }
    end
  end

  def show
    @loading = Loading.find_by_slug(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @loading }
    end
  end

  def new

    @position = Position.find_by_slug(params[:position_id]) if params[:position_id]
    if @position
       @loading = @position.loadings.build(params[:loading])
    else
       @loading = current_patron.loadings.build(params[:loading])
    end

    respond_to do |format|
      format.html
      format.json { render json: @loading }
    end
  end

  def edit
    @loading = Loading.find_by_slug(params[:id])
  end

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

  def update
    @loading = Loading.find_by_slug(params[:id])

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

  def destroy
    @loading = Loading.find_by_slug(params[:id])
    @loading.destroy

    respond_to do |format|
      format.html { redirect_to loadings_url }
      format.json { head :ok }
    end
  end
end
