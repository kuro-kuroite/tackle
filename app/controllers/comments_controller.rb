class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy] # TODO: show はいらないのか

  def create
    @comment = Comment.new(comment_params)
    @comment.task_id = params[:task_id] # TODO: 正式な書き方を模索
    if @comment.save
      redirect_to @comment.task # TODO: 正式な書き方を模索
    else
      # FIXME: 適当な実装方法が見当たらなかった
      @comments = Comment.where(task_id: params[:task_id])
      @task = @comments.first.task
      render :template => "tasks/show" # FIXME: renderの別の呼び方を模索
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.task # TODO: 正式な書き方を考察
  end

  # TODO: edit の実装
  def edit
    @comments = Comment.where(task_id: params[:id])
    @task = @comment.task
  end

  def update
    @comment.update(comment_params) # FIXME: :task_id の反映ができないのでは？
    redirect_to @comment.task
  end

  private

    def comment_params
      params.require(:comment).permit(:content) # TODO: task_id は permit 対象？
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
