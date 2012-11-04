class JunksController < ApplicationController

  before_filter :require_login

  def index
    @junks = current_user.junks.latest.limit(10)

    respond_to do |format|
      format.html
      format.json { render json: @junks }
    end
  end

  def show
  	@junk = Junk.find(params[:id])

  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @junk }
    end
  end

  def destroy
  	@junk = Junk.find(params[:id])

    @junk_item = @junk.junked
    if @junk_item.restore
      @junk.destroy

      respond_to do |format|
        format.html { redirect_to junks_url }
        format.json { head :no_content }
      end
    end
  end

end
