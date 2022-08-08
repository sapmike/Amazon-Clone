require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  describe "relationships" do
   it {should belong_to :product}
   it {should belong_to :order}
  end

  describe 'instance methods' do
     it 'unit_price' do
       @edm_sample_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "EDM Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some awesome EDM samples.")

       @user = User.create(          first_name: "Michael",
                                     last_name: "Sapienza",
                                     email: "sapmike16@yahoo.com",
                                     password: "ilovesamplepacks",
                                     password_confirmation: "ilovesamplepacks")

       order_1 = create(:order, subtotal: 24.99)

       order_item_1 = order_1.order_items.create!(product: @edm_sample_pack, quantity: 2)

       expect(order_item_1.unit_price).to eq(24.99)
     end

    it 'total' do
     @edm_sample_pack = Product.create(cover: "https://cdn.shopify.com/s/files/1/0129/7698/0032/products/min-free-trap-starter-pack_940x1530.png?v=1618931511", title: "EDM Sample Pack", price: "$29.99", actual_price: 24.99, description: "This pack is a compilation-style collection of some awesome EDM samples.")

     @user = User.create(          first_name: "Michael",
                                   last_name: "Sapienza",
                                   email: "sapmike16@yahoo.com",
                                   password: "ilovesamplepacks",
                                   password_confirmation: "ilovesamplepacks")

     order_1 = create(:order, subtotal: 24.99)

     order_item_1 = order_1.order_items.create!(product: @edm_sample_pack, quantity: 2)

     expect(order_item_1.total).to eq(49.98)
    end
  end
end

#finished
