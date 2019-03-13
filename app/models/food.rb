class Food < ApplicationRecord
  has_many :smoothie_foods
  has_one_attached :image

  enum food_category: {フルーツ:0,野菜:1,水分:2,その他:3}

  validates :food_name, presence: true
  validates :food_image, presence: true
  validates :food_category, presence: true
  validates :kcal, presence: true
  validates :kalium, presence: true
  validates :calcium, presence: true
  validates :magnesium, presence: true
  validates :vitaminc, presence: true
  validates :gram, presence: true
  validates :liter, presence: true
end
