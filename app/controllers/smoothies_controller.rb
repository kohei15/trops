class SmoothiesController < ApplicationController
  def top
  end

  def index
    @smoothies = Smoothie.all.order(created_at: "desc")
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
    redirect_to smoothy_path(smoothy.id)
  end

  def new
    @smoothie = Smoothie.new
  end

  def create
    smoothie = Smoothie.new(smoothie_params)
    smoothie.save
    redirect_to '/'
  end

  def destroy
  end

  private
  def smoothie_params
    params.require(:smoothie).permit(:smoothie_name, :image, :smoothie_image, :comment)
  end
end
