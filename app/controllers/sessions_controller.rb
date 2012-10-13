class SessionsController < ApplicationController

  layout 'guest'

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      session[:patron_id] = user.patron_id if user.patron_id
      if params[:remember_me].present?
        cookies[:socialfreight_mail] = params[:email]
        cookies[:socialfreight_rememberme] = params[:remember_me]
      else
        cookies.delete :socialfreight_mail
        cookies.delete :socialfreight_rememberme
      end
      redirect_back_or_to root_url
    else
      flash.now.alert = "Email or password is invalid"
      render :new#, :notice => "Email or password is invalid"
    end
  end
  
  def destroy
    logout
    redirect_to root_url
  end

end
