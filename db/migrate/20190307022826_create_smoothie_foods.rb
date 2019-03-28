class CreateSmoothieFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :smoothie_foods, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :smoothie_id
      t.integer :food_id
      t.integer :quantity

      t.timestamps
    end
  end
end
