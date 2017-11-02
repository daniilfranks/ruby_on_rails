class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)

    if @comment.save
      redirect_to @task, notice: 'Comments posted.'
    else
      redirect_to @task, alert: 'Comments not posted.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
