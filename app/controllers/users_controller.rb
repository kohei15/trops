class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@smoothies = Smoothie.where(user_id: @user.id).order(created_at: "desc")
		# @favorite = Smoothie.where(user_id: current_user).order(created_at: "desc")
		# @smoothies = Smoothie.where(user_id: current_user).order(created_at: "desc")
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
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
	    user = User.find(params[:id])
	    if user.destroy
	      flash[:notice] = "削除しました。"
	      redirect_to users_path
	    else
	      render :index
	    end
	end

	def admin
	end

	private
	def current_user
		user = User.find(params[:id])
		if current_user != user
			redirect_to root_path
		end
	end

	def user_params
		params.require(:user).permit(:name, :email, :encrypted_password)
	end
end
