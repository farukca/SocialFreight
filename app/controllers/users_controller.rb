class UsersController < ApplicationController
 
  before_filter :require_login
  skip_before_filter :require_login, :only => [:new, :activate, :activation, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    if current_user
      @user = current_patron.users.build()
    end
    render :layout => 'guest' unless current_user
  end

  def show
    @user = User.find_by_title!(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if current_patron
      @user.patron_id = current_patron.id
      @user.generate_temp_password
    end
    if @user.save
      redirect_to root_url, :notice => "Activation mail has been sent to your mail!"
    else
      render :new
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      if @user.patron_id.nil?
        redirect_to(login_path, :notice => 'User activated successfully')
      else
        redirect_to(activation_user_path(@user), :notice => 'User activated successfully')
      end
    else
      not_authenticated
    end
  end

  def activation
    @user = User.find_by_title!(params[:id])
    render :layout => 'guest' unless current_user
  end

  def update
    @user = User.find_by_title!(params[:id])

    if @user.update_attributes(params[:user])
      if @user.last_login_at.nil?
        login_user = login(@user.email, params[:user][:password], params[:remember_me])
        if login_user
          session[:patron_id] = login_user.patron_id if login_user.patron_id
          redirect_back_or_to root_url, notice: 'Welcome to SocialFreight.'
        else
          render :new, :notice => "Email or password is invalid"
        end
      else
        redirect_to @user, :notice => "Updated succesfully"
      end
    else
      render :new, :error => "Update error, please try again"
    end
    #user = login(params[:email], params[:password], params[:remember_me])

  end

end
