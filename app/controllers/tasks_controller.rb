class TasksController < ApplicationController
  # This line of code prevent us from taking the method "find_task" and calling it inside each action.
  # DRY principle is important
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end #View the details of each task

  def new
    # Needed to instatiate the form_for
    @task = Task.new
  end

  def create
    # Since we are adding a new task, no need to create a separate "create.hmtl-erb"
    @task = Task.new(task_params)
    @task.save
    # Instead we can redirect to task_path
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    # Same reason as "create method"
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def task_params
    # This prevent assigning request that is not permitted
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
