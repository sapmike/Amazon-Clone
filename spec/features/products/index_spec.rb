require 'rails_helper'

RSpec.describe "Products Index Page", type: :feature do
  describe "When I visit the products index page" do
  before(:each) do

    @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")
  end

  it "I can see a list of all of the products for sale and click 'Show More' to see full details" do

      visit '/'

      click_on "Show More"

        expect(page).to have_content(@trap_starter_pack.title)
        expect(page).to have_content(@trap_starter_pack.actual_price)
        expect(page).to have_content(@trap_starter_pack.price)
    end
  end
end


#revamp?
