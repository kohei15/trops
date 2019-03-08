class Food < ApplicationRecord
  has_many :smoothie_foods

  enum food_category: {フルーツ:0,野菜:1,水分:2,その他:3}
end
