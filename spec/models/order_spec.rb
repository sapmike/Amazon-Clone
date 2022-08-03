require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "relationships" do
    it {should have_many :order_items}
    it {should belong_to :user}
  end
end

  describe 'instance methods' do
    before :each do
      @edm_sample_pack = build(:product, actual_price: 9.99)
      @trap_sample_pack = build(:product, actual_price: 19.99)
      @user = build(:user)
      @order_1 = build(:order, @edm_sample_pack, quantity: 2)
      @order_1 = build(:order, @trap_sample_pack, quantity: 2)
    end


  it 'subtotal' do
    expect(@order_1.subtotal).to eq(59.96)
  end
end
#Need Help
