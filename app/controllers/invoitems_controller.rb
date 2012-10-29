class InvoitemsController < ApplicationController

  before_filter :require_login
  respond_to :html, :js, :json

  def index
    @invoitems = Invoitem.all
    respond_with @invoitems
  end

  def show
    @invoitem = Invoitem.find(params[:id])
    respond_with @invoitem
  end

  def new
    @invoitem_owner = find_invoitem_owner
    @invoitem = @invoitem_owner.invoitems.build()
    @invoitem.owner_reference = @invoitem_owner.to_s
    @invoitem.operation = @invoitem_owner.operation if @invoitem_owner.respond_to?("operation")
    @invoitem.service   = @invoitem_owner.direction if @invoitem_owner.respond_to?("direction")
    respond_with @invoitem
  end

  def edit
    @invoitem = Invoitem.find(params[:id])
    respond_with @invoitem
  end

  def create

    @invoitem = Invoitem.new(params[:invoitem])
    if @invoitem.local_curr.blank?
      @invoitem.local_curr = current_patron.currency
    end
    @invoitem.user_id  = current_user.id
   
    @invoitem.save!
    #respond_with @invoitem, :success => "Document saved successfully"
    redirect_to @invoitem.invoitem_owner, :success => "Document saved successfully"
  end

  def update
    @invoitem = Invoitem.find(params[:id])

    respond_to do |format|
      if @invoitem.update_attributes(params[:invoitem])
        format.html { redirect_to @invoitem, notice: 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def find_invoitem_owner
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end


end
