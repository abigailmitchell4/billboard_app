require 'faker'
# include Faker

25.times do 
  Artist.create(
    name: Faker::Music::RockBand.name, 
  )
end

puts "25 people seeded"