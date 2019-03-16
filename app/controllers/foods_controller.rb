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
    food = Food.find(params[:id])
    food.update(food_params)
    flash[:notice] = "更新しました。"
    redirect_to food_path(food.id)
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_params)
    if food.user_id = user.id(1)
        food.save
        flash[:notice] = "投稿しました。"
        redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :image, :food_image, :food_category, :kcal, :kalium, :calcium, :magnesium, :protein, :vitaminc, :liter, :gram, :unit)
  end
end
