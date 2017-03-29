class FavoritesController < ApplicationController

	def create
		@list = List.find(params[:list_id])
    current_user.favorite(@list)
    respond_to :js
	end

	def destroy
    list_id = Favorite.find(params[:id]).list_id
    @list   = List.find(list_id)
    current_user.unfollow(list_id)
    respond_to :js
  end
end
