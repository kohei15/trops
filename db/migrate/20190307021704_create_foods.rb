class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :food_image
      t.integer :food_category
      t.float :kcal
      t.float :kalium
      t.float :calcium
      t.float :magnesium
      t.float :protein
      t.float :vitaminc
      t.float :liter
      t.float :gram
      t.string :unit

      t.timestamps
    end
  end
end
