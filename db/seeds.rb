# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

# User.create!(id: "1", name: "われはかみなり", email: "admin@gmail.com", password: "admin", role: "1")

(1..10).each do |i|
     User.create!(id: i, name: "ユーザー#{i}", email: "test#{i}@gmail.com", password: "testtest")
     10.times do |j|
     	Smoothie.create!(smoothie_name: "スムージー#{i}", comment: "コメントコメントコメントコメント", user_id: i)
	end
end

require 'csv'
csv_data = CSV.read('db/seed.csv', headers: true)
csv_data.each do |data|
  Food.create!(food_name: data[0] ,food_image: data[1],	food_category: data[2].to_i, kcal: data[3], kalium: data[4], calcium: data[5], magnesium: data[6], protein: data[7], vitaminc: data[8], gram: data[9], liter: data[10], unit: data[11],)
end