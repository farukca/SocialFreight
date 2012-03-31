class PackagesController < ApplicationController

  before_filter :require_login

  def new
    if params[:container_id]
      @container = Container.find(params[:container_id])
      @package = @container.packages.build(params[:package])
      @package.loading = @container.loading
    else
      @loading = Loading.find(params[:loading_id]) if params[:loading_id]
      @package = @loading.packages.build(params[:package])
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def create
    @package = Package.new(params[:package])

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package.loading, notice: 'Package added successfully.' }
        format.json { render json: @package, status: :created, location: @package }
      else
        format.html { render action: "new" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @package = Package.find(params[:id])

    respond_to do |format|
      if @package.update_attributes(params[:package])
        format.html { redirect_to @package.loading, notice: 'Package was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @loading = @package.loading
    @package.destroy

    respond_to do |format|
      format.html { redirect_to @loading, notice: 'Package deleted.' }
      format.json { head :ok }
    end
  end

end
