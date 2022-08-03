require 'rails_helper'

RSpec.describe 'Cart show' do
  describe 'When I have added items to my cart' do
    describe 'and visit my cart path' do
      before(:each) do

      @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")

      @edm_sample_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "EDM Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some awesome EDM samples.")


        visit "/products/#{@trap_starter_pack.id}"
        click_on "Add To Cart"
        visit "/products/#{@edm_sample_pack.id}"
        click_on "Add To Cart"
        @products_in_cart = [@trap_starter_pack, @edm_sample_pack]
      end

      it 'there is a button to delete the item next to each item' do

        visit "/cart"

        @products_in_cart.each do |item|
          within "#cart-product-#{item.id}" do
            expect(page).to have_button("Remove Items")
          end
        end
      end

      it 'I can delete individual items from my cart' do

        visit "/cart"

        within "#cart-item-#{@trap_starter_pack.id}" do
          click_on "Remove Items"
        end

        expect(current_path).to eq("/cart")
        expect(page).to_not have_content("#cart-item-#{@trap_starter_pack.id}")
        expect(page).to have_content("#cart-item-#{@edm_sample_pack.id}")
      end
    end
  end
end

#need help
