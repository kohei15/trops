class FoodsController < ApplicationController
  def index
    if user_signed_in?
      if current_user.id == 1
        @foods = Food.all
      end
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      if current_user.id == 1
        @food = Food.find(params[:id])
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if user_signed_in?
      if current_user.id == 1
        @food = Food.find(params[:id])
      end
    else
      redirect_to root_path
    end
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    flash[:notice] = "更新しました。"
    redirect_to food_path(food.id)
  end

  def new
    if user_signed_in?
      if current_user.id == 1
        @food = Food.new
      end
    else
      redirect_to root_path
    end
  end

  def create
    food = Food.new(food_params)
    food.user_id = 1
        food.save
        flash[:notice] = "投稿しました。"
        redirect_to foods_path
  end

  def destroy
  end

  private
  def food_params
    params.require(:food).permit(:food_name, :image, :food_image, :food_category, :kcal, :kalium, :calcium, :magnesium, :protein, :vitaminc, :liter, :gram, :unit, :user_id)
  end
end
