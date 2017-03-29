class HomeController < ApplicationController

  def index
  	@lists = current_user.lists.all
  	@users = User.all_except(current_user)
  end

  def my_lists
  	redirect_to root_path
  end

  def users
  	@lists = current_user.lists.all
  	@users = User.all_except(current_user)
  end

  def favorites
    @favorites_list = current_user.favorite_lists
  end
end
