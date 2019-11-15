require 'faker'
# include Faker

# 25.times do 
#   Artist.create(
#     name: Faker::Music.band, 
#     avatar: Faker::Music.album,
#   )
# end

25.times do 
  Artist.create(
    name: Faker::Music.band, 
    avatar: Faker::Music.album,
    
    songs_attributes: [
      {
        title: Faker::Book.title,
        artist_name: Faker::Music.band, 
        album: Faker::Music.album,
        rating: Faker::Number.within(range: 1..10),
        country: Faker::Address.country_name_to_code,
      }
    ]
  )
end

# songs = 25.times.map do
#   Song.create(
#           title: Faker::Book.title,
#           artist_name: Faker::Music.band, 
#           album: Faker::Music.album,
#           rating: Faker::Number.within(range: 1..10),
#           country: Faker::Address.country_name_to_code
#           )
# end

# 25.times do 
#   Artist.create(
#     name: Faker::Music.band, 
#     avatar: Faker::Music.album
#   )

puts "25 people seeded"