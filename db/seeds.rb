# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

file = URI.open('https://www.mtbici.it/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/a/r/aria_e-road.jpg')
bike = Bike.new(model: "Aria E-Road 28'' 11V Bianchi",
                brand: "Bianchi",
                description: "The Aria e-Road electric bike has an all carbon frame with aerodynamic lines and uses the Ebikemotion X35 V.2 technology. The Ebikemotion X35 motor, mounted in the rear hub, is the most compact and lightweight in the world and also very powerful in that it develops 40 Nm of torque! The battery can support up to 1200 meters of altitude with its power.",
                address: "Fraunhoferstraße 33, 80687 Munich",
                price: 4000)
bike.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
