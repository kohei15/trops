class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :food_image
      t.string :food_category, default: 0, null: false, limit: 1
      t.float :kcal
      t.float :kalium
      t.float :calcium
      t.float :magnesium
      t.float :b_carotene
      t.float :vitaminc
      t.float :liter
      t.float :gram
      t.string :unit

      t.timestamps
    end
  end
end
