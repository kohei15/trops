class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
			flash[:notice] = "変更内容を更新しました"
			sign_in(@user, :bypass => true)
			redirect_to root_path
		else
			render :edit
		end
	end

	def new
	end

	def create
	end

	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
