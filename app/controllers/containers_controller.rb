class ContainersController < ApplicationController

  before_filter :require_login

  def new
    @loading   = Loading.find_by_slug!(params[:loading_id]) if params[:loading_id]
    @container = @loading.containers.build(params[:container])
  end

  def edit
    @container = Container.find(params[:id])
  end

  def create
    @loading   = Loading.find_by_slug!(params[:loading_id])
    @container = @loading.containers.build(params[:container])

    respond_to do |format|
      if @container.save
        format.html { redirect_to @loading, notice: 'Container added successfully.' }
        format.json { render json: @container, status: :created, location: @container }
      else
        format.html { redirect_to @loading, alert: 'Errors on creating container.' }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @container = Container.find(params[:id])

    respond_to do |format|
      if @container.update_attributes(params[:container])
        format.html { redirect_to @container.loading, notice: 'Container was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @container = Container.find(params[:id])
    @loading   = @container.loading
    @container.destroy

    respond_to do |format|
      format.html { redirect_to @loading, notice: 'Container deleted.' }
      format.json { head :ok }
    end
  end

end
