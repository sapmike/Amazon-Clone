require 'rails_helper'

RSpec.describe 'When I visit an items show page', type: :feature do

  before(:each) do

    @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")
  end


  describe 'As a visitor, non-logged in user' do
      it "won't have the ability to add product to cart" do
        visit "/products/#{@trap_starter_pack.id}"
        expect(page).to_not have_button("Add To Cart")
      end

      it "I can't add this item to my cart" do

        visit "/products/#{@trap_starter_pack.id}"

        expect(current_path).to eq("/products/#{@trap_starter_pack.id}")
        expect(page).to_not have_content("My Cart")
        end
      end

    default_user = User.create(   first_name: "Michael",
                               last_name: "Sapienza",
                               email: "sapmike16@yahoo.com",
                               password: "ilovesamplepacks",
                               password_confirmation: "ilovesamplepacks")


    describe 'if user is logged in' do
      it 'I do see a link to view cart' do

        visit '/login'

        fill_in "Email", with: default_user.email
        fill_in "Password", with: default_user.password

        click_button "Login"


        visit "/products/#{@trap_starter_pack.id}"
        expect(page).to have_button('Add To Cart')
        expect(page).to have_content("My Cart")
      end
   end
end

#finished
