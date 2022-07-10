require 'rails_helper'

RSpec.describe "Products Index Page" do
  before(:each) do

    @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")
  end

  describe "When I visit the products index page" do

  it "I can see a list of all of the products for sale" do

      visit '/products'

      within "#product-#{@trap_starter_pack.id}" do
        expect(page).to have_content(@trap_starter_pack.title)
        expect(page).to have_content(@tire.actual_price)
        expect(page).to have_css("img[src*='#{@trap_starter_pack.cover}']")
      end

  it "Should take me to product show page when image clicked" do

        visit '/prodcuts'

        within "#item-#{@trap_starter_pack.id}" do
          find("#img-#{@trap_starter_pack.id}").click
        end

        expect(current_path).to eq("/products/#{@trap_starter_pack.id}")
      end
    end
  end
end
