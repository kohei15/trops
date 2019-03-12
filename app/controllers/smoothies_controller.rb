class SmoothiesController < ApplicationController
  def top
  end

  def index
    @smoothies = Smoothie.all.order(created_at: "desc").includes(:user)
  end

  def show
    @smoothie = Smoothie.find(params[:id])
  end

  def edit
    @smoothie = Smoothie.find(params[:id])
  end

  def update
    smoothie = Smoothie.find(params[:id])
    smoothie.update(smoothie_params)
    redirect_to smoothy_path(smoothie.id)
  end

  def new
    @smoothie = Smoothie.new
  end

  def create
    smoothie = Smoothie.new(smoothie_params)
    if smoothie.user_id = current_user.id
        smoothie.save
        flash[:notice] = "投稿しました。"
        redirect_to smoothy_path(smoothie.id)
    else
      render :new
    end
  end

  def destroy
  end

  def custom
    @smoothie = Smoothie.new
  end

  private
  def smoothie_params
    params.require(:smoothie).permit(:smoothie_name, :image, :smoothie_image, :comment, :user_id)
  end
end
