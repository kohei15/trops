class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :food_image
      t.string :food_category
      t.integer :kcal
      t.integer :kalium
      t.integer :calcium
      t.integer :magnesium
      t.integer :b_carotene
      t.integer :vitaminc
      t.integer :liter
      t.integer :gram
      t.string :unit

      t.timestamps
    end
  end
end
