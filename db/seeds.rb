# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

10.times do |i|
     User.create!(id: "#{i + 2}", name: "テスト#{i + 1}", email: "test#{i + 1}@gmail.com", password: "testtest#{i + 1}")
     Smoothie.create!(smoothie_name: "スムージー#{i + 1}", comment: "コメントコメントコメントコメント", user_id: "#{i + 2}")
end

require 'csv'
csv_data = CSV.read('db/seed.csv', headers: true)
csv_data.each do |data|
  Food.create!(data.to_hash)
end