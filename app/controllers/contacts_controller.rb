class ContactsController < ApplicationController

  before_filter :require_login

  def index
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  def new
    @contact = Contact.new
    @contact.company_id = params[:company_id] if params[:company_id]
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_user.contacts.build(params[:contact])
    #@contact.patron_id    = current_patron.id
    #@contact.patron_token = current_patron.token
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

end
