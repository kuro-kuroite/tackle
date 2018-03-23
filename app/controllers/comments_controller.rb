class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy] # TODO: edit, show はいらないのか

  def create
    @comment = Comment.new(comment_params)
    @comment.task_id = params[:task_id] # TODO: 正式な書き方を模索
    @comment.save
    redirect_to @comment.task # TODO: 正式な書き方を模索
  end

  def destroy
    @comment.destroy
    redirect_to @comment.task # TODO: 正式な書き方を考察
  end

  # TODO: edit の実装

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
