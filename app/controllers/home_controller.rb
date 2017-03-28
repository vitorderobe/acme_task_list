class HomeController < ApplicationController

  def index
  	@lists = current_user.lists.all
  	@users = User.all
  end
end
