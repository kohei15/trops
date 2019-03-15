class Food < ApplicationRecord
  has_many :smoothie_foods
  has_one_attached :image

  enum food_categories: {フルーツ:0,野菜:1,水分:2,その他:3}

  validates :food_name, presence: true, uniqueness: true
  validates :food_image, presence: true
  validates :food_category, presence: true
  validates :kcal, presence: true
  validates :kalium, presence: true
  validates :calcium, presence: true
  validates :magnesium, presence: true
  validates :protein, presence: true
  validates :vitaminc, presence: true
end
