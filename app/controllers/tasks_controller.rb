class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]

  # TODO: CRUD の開発手順を考察、C、V
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to tasks_path # TODO: 正式な書き方を考察
  end

  def edit
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end

  def update
    @task.update(task_params)
    redirect_to @task
  end

  private

    def task_params
      params.require(:task).permit(:name, :deadline)
    end

    def set_task
      @task = Task.find(params[:id])
    end
end
