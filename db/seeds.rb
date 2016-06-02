# User.create!(email: "jim@example.com",
#              password: "password",
#              password_confirmation: "password")

10.times do
  title  = Faker::Name.name
  artist = Faker::Book.title
  genre  = Faker::Commerce.department(2, true)
  cover  = Faker::Avatar.image("my-own-slug", "50x50", "jpg")
  Album.create!(title:  title,
                artist: artist,
                genre:  genre,
                cover:  cover)
end

# Song: Faker::Hipster.sentence(3)