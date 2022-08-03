require 'rails_helper'

RSpec.describe OrderItem, type: :model do

describe "relationships" do
   it {should belong_to :product}
   it {should belong_to :order}
 end

 describe 'instance methods' do
   it 'unit_price' do
     edm_sample_pack = build(:product)
     user = build(:user)
     order_1 = build(:order_item)

     expect(order_1.unit_price).to eq(19.99)
   end

 describe 'after_update' do
   it 'total' do
     edm_sample_pack = build(:product)
     user = build(:user)
     order_1 = build(:order_item, quantity: 2)

     expect(order_1.total).to eq(39)
    end
   end
  end
end
#Need help
