require 'faker'

# User.destroy_all
# Equipment.destroy_all
# Booking.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  first_name: "John",
  last_name: "Baker",
  email: "john.baker@gmail.com",
  address: "123 Main Street",
  password: 123123
)

User.create(
  first_name: "Keina",
  last_name: "Morikawa",
  email: "keina.morikawa@me.com",
  address: "1-2-45 Chuomachi",
  password: 123123
)

# A random comment

20.times do
  Equipment.create!(
    model: Faker::Camera.model,
    brand: Faker::Camera.brand,
    description: Faker::Lorem.sentences(number: 3),
    price: 2000,
    user: User.all.sample
  )
end

Booking.create!(
  from: Date.new(2023, 2, 21),
  until: Date.new(2023, 2, 24),
  status: true,
  equipment: Equipment.all.first,
  user: User.all.first
)
Booking.create!(
  from: Date.new(2023, 2, 21),
  until: Date.new(2023, 2, 24),
  status: true,
  equipment: Equipment.last,
  user: User.last
)
