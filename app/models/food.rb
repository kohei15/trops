class Food < ApplicationRecord
  has_many :smoothie_foods
  has_many :smoothies, through: :smoothie_foods
  belongs_to :user
  has_one_attached :image

  enum food_category: {fruits: 0,vegetable:1,other:2}

  validates :food_name, presence: true, uniqueness: true
  validates :kcal, presence: true
  validates :kalium, presence: true
  validates :calcium, presence: true
  validates :magnesium, presence: true
  validates :protein, presence: true
  validates :vitaminc, presence: true
end