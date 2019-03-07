class CreateSmoothies < ActiveRecord::Migration[5.2]
  def change
    create_table :smoothies do |t|
      t.string :smoothie_name
      t.string :smoothie_image
      t.text :comment
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.integer :user_id

      t.timestamps
    end
  end
end
