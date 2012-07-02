class PositionsController < ApplicationController

  before_filter :require_login#, :current_patron

  def index
    @positions = Position.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @positions }
    end
  end

  def show
    @position  = Position.find(params[:id])
    @transnode = Transnode.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  def new
    @position = current_patron.positions.build(params[:position])
    @position.operation = params[:operation] if params[:operation]
    @position.transnodes.build(:trans_method => @position.operation)
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
  end

  def create
    @position = current_patron.positions.build(params[:position])
    @position.patron_token = current_patron.token
    @position.user_id = current_user.id

    respond_to do |format|
      if @position.save
        #format.html { redirect_to @position, notice: 'Position was successfully created.' }
        #format.html { redirect_to @position, notice: 'Position was successfully created.' }
        format.html { redirect_to new_position_transnode_path(@position, :fromwhere => 'position'), notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to positions_url }
      format.json { head :ok }
    end
  end

  def addload
    @loadids  = params[:loadids]
    unless @loadids.blank?
      @position = Position.find(params[:id])  
      @position.connect_loadings(loadids)
    end
  end

  def follow
    @position = Position.find(params[:id])
    current_user.follow(@position)
  end

  def unfollow
    @position = Position.find(params[:id])
    current_user.unfollow(@position)
  end

end
