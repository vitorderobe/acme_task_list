class TasksController < ApplicationController

  def new
  end

  def create
  	list_id = tasks_params[:list_id]
    @task = List.find(list_id).tasks.build(tasks_params.except(:list_id))
    if @task.save
      render partial: 'tasks/new'
    else
      # flash[:danger] = "fail"
      render layout: false
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:description, :list_id)
  end
end
