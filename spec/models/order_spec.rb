require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "relationships" do
    it {should have_many :order_items}
    it {should belong_to :user}
  end

  describe 'instance methods' do
    it 'subtotal' do

      @edm_sample_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "EDM Sample Pack", price: "$29.99", actual_price: 25, description: "This pack is a compilation-style collection of some awesome EDM samples.")

      @trap_starter_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "TRAP Starter Sample Pack", price: "$29.99", actual_price: 25, description: "This pack is a compilation-style collection of some of our personal favorite samples from a ton of different Cymatics packs we’ve released. Inside you’ll find everything you’ll need to produce a dope trap record, with some of our best melodies, drums, fx, and more. Inspired by records from artists such as Travis Scott, Young Thug, Lil Baby, Drake, Lil Uzi, and more.")


      @user = User.create(          first_name: "Michael",
                                    last_name: "Sapienza",
                                    email: "sapmike16@yahoo.com",
                                    password: "ilovesamplepacks",
                                    password_confirmation: "ilovesamplepacks")


    order_1 = create(:order)

    order_item_1 = order_1.order_items.create!(product: @edm_sample_pack,  quantity: 2)

    order_item_2 = order_1.order_items.create!(product: @trap_starter_pack,  quantity: 2)

    expect(order_1.subtotal).to eq(100)
    end
  end
end




#Need Help
