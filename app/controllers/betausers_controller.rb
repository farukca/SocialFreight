class BetausersController < ApplicationController

  def create
    @betauser = Betauser.new(params[:betauser])

    respond_to do |format|
      if @betauser.save
        format.html { redirect_to @betauser, notice: 'betauser successfully created.' }
        format.json { render json: @betauser, status: :created, location: @betauser }
      else
        format.html { render action: "new" }
        format.json { render json: @betauser.errors, status: :unprocessable_entity }
      end
    end
  end

end
