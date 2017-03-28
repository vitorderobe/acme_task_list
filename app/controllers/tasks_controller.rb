class TasksController < ApplicationController

  def new
  end

  def create
    @task = List.find(params[:list_id]).tasks.build(tasks_params)
    if @task.save
      respond_to :js
    else
      # flash[:danger] = "fail"
      render layout: false
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:description)
  end
end
