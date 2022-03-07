# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
FactoryBot.create(:user, email: 'u1@example.com', password: 'password')
FactoryBot.create(:user, email: 'u2@example.com', password: 'password')
FactoryBot.create(:user, email: 'u3@example.com', password: 'password')
FactoryBot.create(:user, email: 'u4@example.com', password: 'password')

FactoryBot.create(:place, name: 'Aeroplane')
FactoryBot.create(:place, name: 'Bank')
FactoryBot.create(:place, name: 'Beach')
FactoryBot.create(:place, name: 'Boulevard Theatre')
FactoryBot.create(:place, name: 'Casino')
FactoryBot.create(:place, name: 'Cathedral')
FactoryBot.create(:place, name: 'Circus Tent')
FactoryBot.create(:place, name: 'Corporate Party')
FactoryBot.create(:place, name: 'Crusader Army')
FactoryBot.create(:place, name: 'Wellness Centre')
FactoryBot.create(:place, name: 'Consulate')
FactoryBot.create(:place, name: 'Hospital')
FactoryBot.create(:place, name: 'Hotel')
FactoryBot.create(:place, name: 'Army Base')
FactoryBot.create(:place, name: 'Film Studio')
FactoryBot.create(:place, name: 'Ocean Liner')
FactoryBot.create(:place, name: 'Passenger Train')
FactoryBot.create(:place, name: 'Pirate Ship')
FactoryBot.create(:place, name: 'Polar Station')
FactoryBot.create(:place, name: 'Police Station')
FactoryBot.create(:place, name: 'Restaurant')
FactoryBot.create(:place, name: 'School')
FactoryBot.create(:place, name: 'Service Station')
FactoryBot.create(:place, name: 'Space Station')
FactoryBot.create(:place, name: 'Submarine')
FactoryBot.create(:place, name: 'Supermarket')
FactoryBot.create(:place, name: 'University')
