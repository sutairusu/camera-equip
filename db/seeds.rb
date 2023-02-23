require 'faker'
require 'open-uri'

puts "Cleaning database. Removing all existing bookings, cameras and users..."
Booking.destroy_all
Camera.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Creating users..."
User.create!(
  first_name: "John",
  last_name: "Baker",
  email: "john.baker@gmail.com",
  address: "123 Main Street",
  password: 123123
)

User.create!(
  first_name: "Keina",
  last_name: "Morikawa",
  email: "keina.morikawa@me.com",
  address: "1-2-45 Chuomachi",
  password: 123123
)

User.create!(
  first_name: "Mandil",
  last_name: "Malla",
  email: "mallamandilcoding@gmail.com",
  address: "456 45th Street",
  password: 123123
)

User.create!(
  first_name: "Emika",
  last_name: "Sangu",
  email: "em888ka@gmail.com",
  address: "789 Forestry Road",
  password: 123123
)

User.create!(
  first_name: "Kurisu",
  last_name: "Sutairusu",
  email: "sutairusu@me.com",
  address: "345 14th Street",
  password: 123123
)

puts "Creating cameras..."
# Camera.create!(
#   model: "",
#   brand: "",
#   description: "",
#   price: "",
#   user: User.all.sample
# )
# image_one = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
# article = Article.new(title: "NES", body: "A great console")
# article.photo.attach(io: image_one, filename: "nes.png", content_type: "image/png")
# article.save

cameras = [
  {model: "D3500", brand: "Nikon", description: "The Nikon D3500 is a long-standing favorite. It's by no means the most advanced DSLR you can get, but its simplicity, its controls, and the quality of the images it can create make it a great recommendation for anyone.", price: 3000, user: User.all.sample},
  {model: "OM-D E-M10 Mark IV", brand: "Olympus", description: "With a flip-over screen for selfies and very good in-body image stabilization, the Olympus OM-D E-M10 Mark IV is ideal for learning about photography and video and portable enough for daily use. With 4K video and attractive styling, the E-M10 Mark IV is ideal as an entry-level camera that can do pretty much everything.", price: 2000, user: User.all.sample},
  {model: "Hero11 Black", brand: "GoPro", description: "Despite the Hero 11 Black looking like every other GoPro since 2019, with upgraded hardware and software, it's a triumph on all fronts. The new, almost square sensor is supremely versatile, the camera's software has been simplified successfully, and GoPro's companion app, Quik has also been improved. With best-in-class stabilization, great-looking video in all but dimly-lit and dark scenes, and some fun new modes like light painting, the Hero 11 Black is an excellent addition to the line.", price: 1500, user: User.all.sample},
  {model: "X S10", brand: "Fujifilm", description: "This is no 'amateur' camera - its build quality and handling stand out straight away. The excellent finish, build quality and handling, and the inclusion of IBIS (in-body stabilization) give this camera a very broad appeal to produce perhaps the best combination of performance, quality, and value in the APS-C mirrorless camera market right now.", price: 2500, user: User.all.sample},
  {model: "ZV-1", brand: "Sony", description: "The Sony ZV-1 has a fixed 3x zoom lens and a 1-inch sensor that's smaller than its Micro Four Thirds and APS-C rivals, but it makes up for it with a super-compact body small enough to slip into a jacket or even a trouser pocket, and a body, controls, audio system and rear that are optimized brilliantly for vlogging.", price: 2500, user: User.all.sample},
  {model: "A7R Mark IV", brand: "Sony", description: "The Sony A7R Mark IV has the highest resolution yet in a full-frame camera. It's not just the detail rendition that's stellar, but this camera's 4K video capability and 10fps continuous shooting speed - all combined with in-body 5-axis image stabilization and one of the most powerful autofocus systems the world has seen, complete with the world's best (so far) eye AF.", price: 3500, user: User.all.sample}
]

camera_images = [
  ["app/assets/images/Nikon-D3500_1.jpg", "app/assets/images/Nikon-D3500_2.jpg"],
  ["app/assets/images/Olympus-OM-D-E-M10-Mark-IV_1.jpeg", "app/assets/images/Olympus-OM-D-E-M10-Mark-IV_2.jpeg"],
  ["app/assets/images/GoPro-Hero11-Black_1.jpeg", "app/assets/images/GoPro-Hero11-Black_2.jpg"],
  ["app/assets/images/Fujifilm-X-S10_1.jpeg", "app/assets/images/Fujifilm-X-S10_2.jpeg"],
  ["app/assets/images/Sony-ZV-1_1.jpg", "app/assets/images/Sony-ZV-1_2.jpg"],
  ["app/assets/images/Sony-A7R-Mark-IV_1.jpg", "app/assets/images/Sony-ZV-1_2.jpg"]
]

cameras.each_with_index do |camera, index|
  c = Camera.new(camera)
  file_paths = camera_images[index]
  file_paths.each do |file_path|
    file = File.open(file_path)
    c.images.attach(io: file, filename: "#{c.model}.jpeg")
  end
  c.save!
end

puts "Creating bookings..."
Booking.create!(
  from: Date.new(2023, 2, 24),
  until: Date.new(2023, 2, 27),
  status: true,
  camera: Camera.first,
  user: User.first
)
Booking.create!(
  from: Date.new(2023, 2, 21),
  until: Date.new(2023, 2, 24),
  status: true,
  camera: Camera.last,
  user: User.last
)

puts "Finished!"
