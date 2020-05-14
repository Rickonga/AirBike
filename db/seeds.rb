# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Bike.destroy_all
Category.destroy_all
User.destroy_all

user1 = User.create(name: "Riccardo", email: "riccardo@lewagon.com", password: "password")
user2 = User.create(name: "Victor", email: "victor@lewagon.com", password: "password")
user3 = User.create(name: "Benedikt", email: "benedikt@lewagon.com", password: "password")
user4 = User.new(name: "admin", email: "admin@lewagon.com", password: "password")
user4.admin = true
user4.save
user5 = User.create(name: "Charly", email: "charly@lewagon.com", password: "password")
user6 = User.create(name: "Johnson", email: "boris@lewagon.com", password: "password")
user7 = User.create(name: "Trump", email: "donald@lewagon.com", password: "password")

user_img5 = URI.open("https://image.gala.de/22119266/uncropped-0-0/515262c62f5409fb3075018d0620201c/Ph/charlie-sheen.jpg")
user_img6 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Boris_Johnson_official_portrait_%28cropped%29.jpg/440px-Boris_Johnson_official_portrait_%28cropped%29.jpg")
user_img7 = URI.open("https://images.unsplash.com/photo-1580128660010-fd027e1e587a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1100&q=60")

user5.photo.attach(io: user_img5, filename: 'nes.png', content_type: 'image/png')
user6.photo.attach(io: user_img6, filename: 'nes.png', content_type: 'image/png')
user7.photo.attach(io: user_img7, filename: 'nes.png', content_type: 'image/png')


categories = ["Road Bike", "Cyclocross Bike", "Touring Bike", "Adventure Road Bike", "Triathlon/Time Trial Bike", "Fitness Bike", "Track/Fixed-Gear Bikes", "Mountain Bikes", "Hybrid Bikes", "Dual-Sport Bikes", "Cruiser Bikes", "Flat-Foot Comfort Bikes", "City Bikes", "BMX Bikes", "Folding Bikes", "Recumbent Bikes", "Tandem Bikes", "Adult Tricycles"]
categories.each do |e|
  Category.create(name: e)
end


radl = Bike.create([
                  { user: User.first,
                    model: "101", price: 15,
                    address: "Washington",
                    description: "The definition of a bicycle is a two-wheeled vehicle with one wheel in front of the other which is propelled using foot pedals. A two-wheeled vehicle that you pedal is an example of a bicycle. Bicycle is defined as to ride a two-wheeled vehicle that you propel forward by pedaling with your feet. When you ride a two-wheeled vehicle (also called a bicycle), this is an example of a time when you bicycle.",
                    category: Category.first},
                  { user: User.second,
                    model: "35E0554",
                    price: 150,
                    address: "Frankfurt",
                    description: "this bike does this and that and it is very convienient and nice and it will impress your parents and all people around.",
                    category: Category.second}])
20.times do
  file = URI.open('https://www.mtbici.it/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/a/r/aria_e-road.jpg')
  bike = Bike.create!(model: "Aria E-Road 28'' 11V Bianchi",
                  brand: "Bianchi",
                  description: "The Aria e-Road electric bike has an all carbon frame with aerodynamic lines and uses the Ebikemotion X35 V.2 technology. The Ebikemotion X35 motor, mounted in the rear hub, is the most compact and lightweight in the world and also very powerful in that it develops 40 Nm of torque! The battery can support up to 1200 meters of altitude with its power.",
                  address: "Fraunhoferstraße 33, 80687 Munich",
                  price: 4000,
                  user: User.third,
                  category: Category.third)

  bike.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "Created #{Bike.count}"
end
