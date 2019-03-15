class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_paramas)
    redirect_to @food
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_params)
    food.save
    flash[:notice] = "投稿しました。"
    redirect_to foods_path
  end

  def destroy
  end

  def food_params
    params.require(:food).permit(:food_name, :image, :food_image, :food_category, :kcal, :kalium, :calcium, :magnesium, :protein, :vitaminc, :liter, :gram, :unit)
  end
end
