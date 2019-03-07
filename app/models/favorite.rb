class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :smoothie

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
