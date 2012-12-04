class FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.all

    respond_to do |format|
      format.html { render :layout => "admin" }
      format.json { render json: @feedbacks }
    end
  end

  def new

    @feedback = Feedback.new
    if current_user
      @feedback.email = current_user.email
      @feedback.name  = current_user
    end

    respond_to do |format|
      if params[:nolayout]
        format.html { render partial: 'modal_form', locals: { feedback: @feedback } }
      else
        format.html # new.html.erb
      end
      format.json { render json: @feedback }
    end
  end

  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @feedbacks }
    end
  end

  def create
    @feedback = Feedback.new(params[:feedback])

    respond_to do |format|
      if @feedback.save
        flash[:notice] = "Feedback successfully created."
        format.html { redirect_to @feedback }
        format.js
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @feedbacks }
    end
  end
  
  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

end
