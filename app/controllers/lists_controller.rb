class ListsController < ApplicationController

  def create
    @list = current_user.lists.build(lists_params)
    if @current_list_id = @list.save
      @current_list_id = current_user.lists.last.id
      render partial: 'tasks/new'
    else
      # flash[:danger] = "fail"
      render layout: false
    end
  end

  private

  def lists_params
    params.require(:list).permit(:title, :private)
  end

end
