# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Airport.destroy_all 
 
airports =["CDG","SGP","ORL","JFK","AAA","BBB","CCC","DDD","EEE","FFF"]
airports.each do |a|
 Airport.create!(airport_code: a)
end

200.times do |fly|
    Flight.create!(duration: rand(300), 
        departure_date: Faker::Date.forward(15),
        departure_airport_id: rand(1..10),
       arrival_airport_id: rand(1..10))
end