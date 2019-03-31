class SmoothiesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :update, :create, :new]

  def top
  end

  def about
  end

  def inquiryform
  end

  def index
    @smoothies = Smoothie.page(params[:page]).per(20).reverse_order.includes(:user)
  end

  def show
    @smoothie = Smoothie.find(params[:id])
    @smoothie_foods = @smoothie.smoothie_foods
  end

  def edit
    @smoothie = Smoothie.find(params[:id])
  end

  def update
    @smoothie = Smoothie.find(params[:id])
    if @smoothie.update(smoothie_params)
      flash[:notice] = "更新しました。"
      redirect_to smoothies_path
    else
      render :edit
    end
  end

  def new
    @smoothie = Smoothie.new
    @smoothie_food = @smoothie.smoothie_foods.new

    # カテゴリごとに食材を抽出
    @fruits = Food.where(food_category: 0)
    @vegetables = Food.where(food_category: 1)
    @others = Food.where(food_category: 2)

    # 栄養素の計算
    eiyou_hash = {protein: 0, calcium: 0, kalium: 0, magnesium: 0, vitaminc: 0, kcal: 0}
    @eiyou_lists = [eiyou_hash]

    food_num_list = Array.new(0, @fruits.count)
    @food_num_lists = [Array.new(0, @fruits.count),
      Array.new(0, @vegetables.count),
      Array.new(0, @others.count), @others]

    foods = Food.all
  end

  def create
    @smoothie = Smoothie.new(smoothie_params)
    @smoothie.user_id = current_user.id
    if @smoothie.save
      params["smoothie"]["foods"].each do |food,number|
        if number.to_i != 0
          SmoothieFood.create(smoothie_id: @smoothie.id,food_id: food,quantity: number)
        end
      end
      binding.pry
        # render :action => "edit", :views => "smoothies/edit"
        redirect_to smoothies_path
    else
      # binding.pry
      render :new
    end
  end

  def destroy
    smoothie = Smoothie.find(params[:id])
    if smoothie.destroy
      flash[:notice] = "削除しました。"
      redirect_to smoothies_path
    else
      render :edit
    end
  end

  private
  def smoothie_params
    params.require(:smoothie).permit(:smoothie_name, :image, :smoothie_image, :comment, :user_id)
  end
end
