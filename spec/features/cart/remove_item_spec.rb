require 'rails_helper'

RSpec.describe 'Cart show', type: :feature do
  describe 'When I have added items to my cart as a logged in user' do
    describe 'and visit my cart path' do
      before(:each) do

      @user = User.create(          first_name: "Michael",
                                    last_name: "Sapienza",
                                    email: "sapmike16@yahoo.com",
                                    password: "ilovesamplepacks",
                                    password_confirmation: "ilovesamplepacks")
      visit '/login'

      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password

      click_button "Login"


      @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")

        visit "/products/#{@trap_starter_pack.id}"
        click_button "Add To Cart"
        @products_in_cart = [@trap_starter_pack]
      end

      it 'there is a button to delete the item next to each item' do
        visit "/cart"


        expect(page).to have_button("Remove Items")
      end


      it 'I can delete individual items from my cart' do
        visit "/cart"

        click_on "Remove Items"


        expect(current_path).to eq("/cart")
        expect(page).to_not have_content("#cart-item-#{@trap_starter_pack.id}")
      end
    end
  end
end

#passogm
