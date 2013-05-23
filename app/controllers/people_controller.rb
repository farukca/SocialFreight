class PeopleController < ApplicationController

  before_filter :require_login

  def index
    if params[:q]
       q = "%#{params[:q]}%"
       @people = Person.where("lower(name) like ?", q).order(:name, :surname).limit(10)
    else
       @people = Person.all
    end
    respond_to do |format|
      format.html
      format.json { render json: @people.map(&:token_inputs) }
    end

  end

  def new
    @person = Person.new
    @person.name = current_user.name
    @person.surname = current_user.surname
    
    respond_to do |format|
      format.html
      format.json { render json: @person }
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
    @person = Person.find(params[:id])
    @user = @person.user
  end

  def create
    @person = Person.new(params[:person])
    @person.name = current_user.name
    @person.surname = current_user.surname
    @person.user_id = current_user.id
    @person.patron_id = current_patron.id

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Profile updated successfully.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

end
