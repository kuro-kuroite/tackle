class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]

  # TODO: CRUD の開発手順を考察、C、V
  def create
    @task = Task.new(task_params)
    # FIXME: request から地域情報を取得して、create内で JST -> UTC変換をできるようにする
    tz = TZInfo::Country.get("JP")
    @task.deadline = @task.deadline.in_time_zone(tz.zone_names[0])
    # HACK: 9 の部分を地域情報から動的に変更できるようにする
    @task.deadline -= 9.hours
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path # TODO: 正式な書き方を考察
  end

  def edit
  end

  def index
    @tasks = Task.order(deadline: :asc).page(params[:page]).per(10)
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(task_id: params[:id]).order(:created_at).page(params[:page])
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
