# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "cleaning DB ..."
Review.destroy_all
Favourite.destroy_all
Car.destroy_all
Owner.destroy_all

puts "creating owners ..."
owner1 = Owner.create(nickname: 'Joe')
owner2 = Owner.create(nickname: 'Jane')

puts "creating cars ..."
Car.create(brand: 'Toyota', model: 'rav4', year: 2020, fuel: 'Gasoline', owner: owner1)
Car.create(brand: 'Honda', model: 'Civic', year: 2019, fuel: 'Gasoline', owner: owner2)

puts "#{Car.all.count} created and #{Owner.all.count}"
