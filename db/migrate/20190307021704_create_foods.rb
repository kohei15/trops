class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
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
      t.integer :user_id

      t.timestamps
    end
  end
end
