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
    @person = current_patron.people.build()
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to root_url, notice: 'Profile updated successfully.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

end
