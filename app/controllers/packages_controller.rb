class PackagesController < ApplicationController

  before_filter :require_login

  def new
    @packed = find_packed
    @package = @packed.packages.build(params[:package])
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

  private
  def find_packed
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
