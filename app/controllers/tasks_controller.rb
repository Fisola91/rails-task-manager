class TasksController < ApplicationController
  # This line of code prevent us from taking the method "find_task" and calling it inside each action.
  # DRY principle is important
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new # Needed to instatiate the form_for
  end

  def create
    # Since we are adding a new task, no need to create a separate "create.hmtl-erb"
    @task = Task.new(task_params)
    @task.save
    # Instead we can redirect to task_path
    redirect_to task_path(@task)
  end

  # GET /tasks/1/edit
  def edit
  end

  # PATCH/PUT /tasks/1
  def update
    # Same reason as "create method"
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # DESTROY /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_path # no need for app/views/restaurants/destroy.html.erb
  end

  private

  def task_params
    # Only allow a trusted parameter "white list" through
    params.require(:task).permit(:title, :details, :completed)
  end

  # Use callbacks to share setup or constraints between actions
  def find_task
    @task = Task.find(params[:id])
  end
end
