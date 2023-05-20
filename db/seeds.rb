# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Cleaning Restaurants Table'
Restaurant.destroy_all if Rails.env.development ?

puts 'Creating Restaurants'
Faker::Config.locale = 'en-US'
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.unique.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
  puts "Restaurant created - id: #{restaurant.id} name #{restaurant.name}"
end

puts 'Finished!'
# Faker::Restaurant.review
