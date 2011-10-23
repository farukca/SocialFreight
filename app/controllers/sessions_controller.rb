class SessionsController < ApplicationController

  layout 'guest_layout'

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      session[:patron_id] = user.patron_id if user.patron_id
      redirect_back_or_to root_url, :notice => "Welcome {#user.username}!"
    else
      flash.now.alert = "Email or passwaord is invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Bye bye happiness..."
  end

end
