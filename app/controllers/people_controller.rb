class PeopleController < ApplicationController
  def index
  end

  def new
    @person = current_patron.people.build()
  end

  def edit
  end

  def show
  end

end
