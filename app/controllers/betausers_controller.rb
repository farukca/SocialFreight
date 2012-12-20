class BetausersController < ApplicationController

  def index
    @betausers = Betauser.all
    render :layout => "admin"
  end

  def create
    @betauser = Betauser.new(params[:betauser])
    @betauser.ipaddr = request.remote_ip
    #@betauser.country = Timeout::timeout(5) { Net::HTTP.get_response(URI.parse('http://api.hostip.info/country.php?ip=' + request.remote_ip )).body }

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
