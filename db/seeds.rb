# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

# User.create!(id: "1", name: "われはかみなり", email: "admin@gmail.com", password: "admin", role: "1")

(2..10).each do |i|
     User.create!(id: i, name: "ユーザー#{i}", email: "test#{i}@gmail.com", password: "testtest")
     10.times do |j|
     	Smoothie.create!(smoothie_name: "スムージー#{i}", comment: "コメントコメントコメントコメント", user_id: i)
	end
end

require 'csv'
csv_data = CSV.read('db/seed.csv', headers: true)
csv_data.each do |data|
  Food.create!(data.to_hash)
endUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?