class PeopleController < ApplicationController
  def index
  end

  def new
    @person = current_patron.people.build()
  end

  def edit
    @person = Person.find(params[:id])
  end

  def show
  end

end
