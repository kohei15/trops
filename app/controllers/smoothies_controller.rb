class SmoothiesController < ApplicationController
  def top
  end

  def index
    @smoothies = Smoothie.page(params[:page]).per(30).reverse_order.includes(:user)
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
    @smoothie = Smoothie.new(smoothie_params)
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
    @smoothie_food = @smoothie.smoothie_foods.new
    # 部分テンプレート参照用
    @fruits = Food.where(food_category: 0)
    @vegetables = Food.where(food_category: 1)
    @liquids = Food.where(food_category: 2)
    @others = Food.where(food_category: 3)

    eiyou_hash = {protein: 0, calcium: 0, kalium: 0, magnesium: 0, vitaminc: 0, kcal: 0}
    @eiyou_lists = [eiyou_hash, eiyou_hash, eiyou_hash, eiyou_hash, eiyou_hash, eiyou_hash]

    food_num_list = Array.new(0, @fruits.count)
    @food_num_lists = [Array.new(0, @fruits.count), 
      Array.new(0, @vegetables.count),
      Array.new(0, @liquids.count),
      Array.new(0, @others.count), @others]

    # 栄養素の計算
    foods = Food.all
    # render 'custom', formats: 'json', handlers: 'jbuilder'

      # if quantity > 0 #数量が0よりも大きい食材だけを計算に入れたい
        # foods.each do |i|
          # kcal_sum += i.kcal
          # kalium_sum += i.kalium
          # calcium_sum += i.calcium
          # magnesium_sum += i.magnesium
          # protein_sum += i.protein
          # vitaminc_sum += i.vitaminc
          # gram_sum += i.gram
        # end
      # end
  end

  private
  def smoothie_params
    params.require(:smoothie).permit(:smoothie_name, :image, :smoothie_image, :comment, :user_id)
  end
end
