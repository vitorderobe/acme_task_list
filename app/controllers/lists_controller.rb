class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
    respond_to :js
  end

  def create
    @list = current_user.lists.build(lists_params)
    if @list.save
      respond_to :js
    else
      # flash[:danger] = "fail"
      render "home/index"
    end
  end

  private

  def lists_params
    params.require(:list).permit(:title, :private, :id)
  end

end
