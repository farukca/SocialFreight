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
    @loading = Loading.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @loading }
      format.pdf do
        pdf = LoadingPdf.new(@loading)
        send_data pdf.render, filename: "loading_info_#{@loading.reference}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def plan
    @loading = Loading.find(params[:id])
    @listpositions = params[:listpositions]
  end

  def new

    @position = Position.find(params[:position_id]) if params[:position_id]
    @loading  = nil
    unless @position.nil?
       @loading = @position.loadings.build(params[:loading])
       @loading.operation = @position.operation
       @loading.direction = @position.direction
    else
       @loading = Loading.new(params[:loading])
       @loading.operation = params[:operation] if params[:operation]
    end
    @loading.departures.build()
    @loading.arrivals.build()
    
    respond_to do |format|
      format.html
      format.json { render json: @loading }
    end
  end

  def edit
    @loading = Loading.find(params[:id])
  end

  def create
    @loading = Loading.new(params[:loading])
    @loading.user_id = current_user.id

    respond_to do |format|
      if @loading.save
        #current_user.follow(@loading)

        format.html { redirect_to @loading, notice: 'Loading was successfully created.' }
        #format.html { render 'detail', notice: 'Loading was successfully created.' }
        format.json { render json: @loading, status: :created, location: @loading }
      else
        format.html { render action: "new" }
        format.json { render json: @loading.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @loading = Loading.find(params[:id])
    @junk = Junk.send_to_junk(current_user.id, @loading, @loading.reference, @loading.company_name)
    @loading.destroy

    respond_to do |format|
      format.html { redirect_to loadings_url }
      format.json { head :ok }
    end
  end

  def follow
    @loading = Loading.find(params[:id])
    current_user.follow(@loading)
  end

  def unfollow
    @loading = Loading.find(params[:id])
    current_user.unfollow(@loading)
  end

  def addtoplan
    @loading = Loading.find(params[:id])
    @connect = Connect.new
    @connect.loading_id  = params[:id]
    @connect.position_id = params[:position_id]

    if @connect.valid?
       @loading.update_attribute(:position_id, params[:position_id])
    end
  end

end
