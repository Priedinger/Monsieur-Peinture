# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
User.destroy_all
Counter.destroy_all

puts "Creating users:"
victor = User.create!(email: "victor@gmail.com", password: "123456")
puts "Victor created"
pierre = User.create!(email: "pierre@gmail.com", password: "123456")
puts "Pierre created"
puts "Creating counter: 50000 by default"

counter = Counter.create!(surface: '50000')

if (victor.save && victor.save && counter.save)
  puts "Finished"
else
  puts "Error"
end
