require 'faker'
# include Faker

# 25.times do 
#   Artist.create(
#     name: Faker::Music.band, 
#   )
# end

25.times do 
  Song.create(
    title: Faker::Book.title,
    artist_name: Faker::Music.band, 
    album: Faker::Music.album,
    rating: Faker::Number.within(range: 1..10),
    country: Faker::Address.country_name_to_code
  )
end

puts "25 people seeded"