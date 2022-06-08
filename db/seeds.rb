# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = Album.create(cover: "https://i1.sndcdn.com/artworks-eOo2Ge77Obflqr25-AhWRTA-t500x500.jpg", title: "Breaking Hertz EP", artist: "HOWLZ")
Track.create(name: "BLOCK BUSTER", minutes: 4, album_id: a1.id)
Track.create(name: "Chop Suey", minutes: 2, album_id: a1.id)
Track.create(name: "Reckless", minutes: 3, album_id: a1.id)

a2 = Album.create(cover: "https://i.imgur.com/O8R6kMV.png", title: "Singles", artist: "HOWLZ")
Track.create(name: "Walk Away", minutes: 3, album_id: a2.id)
Track.create(name: "Caught In Your Whisper", minutes: 3, album_id: a2.id)
Track.create(name: "UNDERGROUND", minutes: 2, album_id: a2.id)

a3 = Album.create(cover: "https://i.imgur.com/Ho6JtvH.jpeg", title: "Record Label Releases", artist: "HOWLZ")
Track.create(name: "Evil Deeds", minutes: 3, album_id: a3.id)
Track.create(name: "Third Eye", minutes: 4, album_id: a3.id)
