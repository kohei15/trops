# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8


10.times do |i|
     User.create!(name: "テスト#{i + 1}", email: "test#{i + 1}@gmail.com", password: "testtest#{i + 1}")
     Smoothie.create!(smoothie_name: "スムージー#{i + 1}", comment: "コメントコメントコメントコメント", user_id: "#{1}")
     Food.create!(food_name: "食材#{i + 1}", kcal:100, kalium: 100, calcium: 100, magnesium: 100, vitaminc: 100, liter: 100, gram: 100)
end