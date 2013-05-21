class UsersController < ApplicationController
 
  before_filter :require_login
  skip_before_filter :require_login, :only => [:new, :create, :activate, :activation, :update]
  before_filter(:only => [:show]) { |c| c.set_tab "homenavigator" }
    
  def index
    if params[:q]
       q = "%#{params[:q]}%"
       @users = current_patron.users.where("lower(name) like ?", q).order(:name).limit(10)
    else
      @users = current_patron.users.all
    end
    respond_to do |format|
      format.html { render :layout => "admin" } # index.html.erb
      format.json { render json: @users.map(&:token_inputs) }
    end
  end

  def new
    @user = User.new
    if current_user
      @user = current_patron.users.build()
    end
    if current_user
      render layout: "admin"
    else
      render layout: "guest"
    end
  end

  def show
    @user = current_patron.users.find(params[:id])
    if @user.id != current_user.id
      redirect_to @user.person
    end
    @post = Post.new
  end

  def create
    @user = User.new(params[:user])
    if current_patron
      @user.patron_id = current_patron.id
      @user.generate_temp_password
    end
    if @user.save
      @user.add_role :operator
      redirect_to root_url, :notice => "Activation mail has been sent to mail adress!"
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
        redirect_to(activation_user_path(@user))
      end
    else
      not_authenticated
    end
  end

  def activation
    @user = User.find(params[:id])
    render :layout => 'guest'# unless current_user
  end

  def edit
    @user = User.find(params[:id])
    render :layout => "admin"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      if @user.last_login_at.nil?
        login_user = login(@user.email, params[:user][:password], params[:remember_me])
        if login_user
          session[:patron_id] = login_user.patron_id if login_user.patron_id
          #redirect_back_or_to root_url, notice: 'Welcome to SocialFreight.'
           if @user.firstuser
             redirect_to setup_path(:start_wizard)
           else
             redirect_to new_person_path, notice: 'Welcome to SocialFreight.'
           end
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

  def invite_coworkers
    @users = Array.new(10) { User.new }
  end

  def create_coworkers
    @branch_id = params[:branch_id]
    
    @saved_emails = []
    @rejected_emails = []
    @reject_reasons = []
    params[:user_emails].each do |email|
      unless email.blank?
        @user = User.new
        @user.email     = email
        @user.branch_id = @branch_id
        @user.patron_id = current_patron.id
        @user.password  = "Deneme2121"
        @user.password_confirmation  = "Deneme2121"
        if @user.valid?
          @user.save!
          @saved_emails << email
        else
          @rejected_emails << email
          @reject_reasons << @user.errors.full_messages
        end        
      end
    end
  end
  
  def follow
    @followable = find_followable
    unless current_user.follows?(@followable)
      current_user.follow!(@followable)
    else
      current_user.unfollow!(@followable)
    end
  end

  private
  def find_followable
    return params[:model_name].classify.constantize.find(params[:object_id])
  end

end
