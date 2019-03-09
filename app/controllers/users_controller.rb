class UsersController < ApplicationController
	def index
		@users = User.all.order(created_at: "desc")
	end

	def show
		
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
    	user.update(user_params)
    	redirect_to user_path(user.id)
	end

	def new
	end

	def create
	end

	def destroy
	end

	private
	def corrent_user
		user = User.find(params[:id])
		if corrent_user != user
			redirect_to root_path
		end
	end

	def user_params
		params.require(:user).permit(:name, :email, :encrypted_password)
	end
end
