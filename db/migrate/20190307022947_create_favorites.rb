class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :smoothie_id

      t.timestamps

      # 同一ユーザーの複数登録を回避
      t.index :user_id
      t.index :smoothie_id
      t.index [:user_id, :smoothie_id], unique: true
    end
  end
end
