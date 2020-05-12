# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Victor", password: "123456", email: "victor@pissendekuh.de")

Category.create(name: "Mountain Bike")

radl = Bike.create([{ user_id: 1, model: "101", price: 15, description: "The definition of a bicycle is a two-wheeled vehicle with one wheel in front of the other which is propelled using foot pedals.
  A two-wheeled vehicle that you pedal is an example of a bicycle.
  Bicycle is defined as to ride a two-wheeled vehicle that you propel forward by pedaling with your feet.
  When you ride a two-wheeled vehicle
   (also called a bicycle), this is an example of a time when you bicycle.", category_id: 1},
   { user_id: 1, model: "35E0554", price: 150, description: "this bike
  does this and that and it is very convienient and nice and it will impress your parents and all people around.",
  category_id: 1}])
