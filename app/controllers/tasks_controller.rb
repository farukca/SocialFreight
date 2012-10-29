class TasksController < ApplicationController
  
  before_filter :require_login

  def index
  	@tasks = Task.all
  end

  def new
  	@task = Task.new
  end

  def show
  	@task = Task.find(params[:id])
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def create
  	@task = Task.new(params[:task])
  	@task.cruser_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@task = Task.find(params[:id])

  	respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

end
