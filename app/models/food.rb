class Food < ApplicationRecord
  has_many :smoothie_foods

  enum food_category: {野菜:0,果物:1,水分:2,その他:3}
end
