class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
    if current_user
      @user = current_patron.users.build()
    end
    render :layout => 'guest_layout' unless current_user
  end

  def create
    @user = User.new(params[:user])
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
    render :layout => 'guest_layout' unless current_user
  end

  def update
    @user = User.find_by_title!(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        login(@user.email, params[:user][:password], params[:remember_me])
        session[:patron_id] = @user.patron_id if @user.patron_id
        format.html { redirect_to @user, notice: 'Welcome to SocialFreight.' }
        format.json { head :ok }
      else
        format.html { render action: "activation" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    user = login(params[:email], params[:password], params[:remember_me])

  end

end
