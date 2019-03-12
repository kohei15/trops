class FavoritesController < ApplicationController
	def create
		smoothie = Smoothie.find(params[:smoothy_id])
		@favorite = current_user.favorites.new(smoothie_id: smoothie.id)
		@favorite.save
		redirect_to smoothies_path
	end

	def destroy
		smoothie = Smoothie.find(params[:smoothy_id])
		@favorite = current_user.favorites.find_by(smoothie_id: smoothie.id)
		@favorite.destroy
		redirect_to smoothies_path
	end
end
