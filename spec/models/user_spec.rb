require 'rails_helper'

RSpec.describe User, type: :model do

  describe "relationships" do
     it {should have_many :orders}
   end

   describe "validations" do
     it { should validate_presence_of :first_name }
     it { should validate_presence_of :last_name }
     it { should validate_presence_of :email }
     it { should validate_presence_of :password_digest }
   end

  before do
    @user = User.new(
      first_name: "something",
      last_name: "something",
      email: "example@gmail.com",
      password: "example123",
      password_confirmation: "example123"
    )

  end

  describe "Validations" do

    it "should not be valid without a password" do
      user = User.new(
        first_name: "something",
        last_name: "something",
        email: "example@gmail.com",
        password_digest: " ",
      )

      user.save

      expect(user).to_not be_valid
    end

    it "should not be valid without first name" do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "should not be valid without last name" do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it "should not be valid without email" do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end
end
