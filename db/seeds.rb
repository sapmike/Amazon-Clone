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

a1 = Product.create(cover: "https://i.imgur.com/rNOwsnC.png", title: "Hip-Hop Starter Pack", price: "$19.99", description: "Over 100+ samples to get any party started.")

a2 = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-prism-edm-sample-pack_940x1530.png?v=1628536117", title: " Prism EDM Sample Pack", price: "$14.99", description: "Prism is a new sample library that perfectly encapsulates the sound of the new wave of EDM that has taken over. Prism focuses on melodic EDM including House, Future Bass, and some experimental samples that will keep you inspired for months.")

a3 = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-web-flavor_940x1530.png?v=1605842206", title: "Flavor Drum Loops", price: "$19.99", description: "FLAVOR is packed full and top drum loops, all unconventional and perfect for creating a unique identity in your music.")
