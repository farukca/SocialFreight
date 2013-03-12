class TasksController < ApplicationController
  
  before_filter :require_login
  respond_to :js, :json

  def index
  	@tasks = current_user.tasks
  end

  def new
  	@task = Task.new
  end

  def show
  	@task = Task.find(params[:id])
  end

  def edit
  	@task = Task.find(params[:id])
    @todolist = @task.todolist
  end

  def create
    @todolist = Todolist.find(params[:todolist_id])

  	@task = @todolist.tasks.new(params[:task])
  	@task.cruser_id = current_user.id
    @task.user_id   = 0

    @task.save!
    respond_with @task, success: "Successfully saved task"
  end

  def update
  	@task = Task.find(params[:id])

    @task.update_attributes!(params[:task])
    respond_with @task, success: 'task was successfully updated.'
  end

  def destroy
  end

end
