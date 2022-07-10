require 'rails_helper'

RSpec.describe 'As a registered user', type: :feature do
  @user = User.create!(       first_name: "Michael",
                              last_name: "Sapienza",
                              password: "ilovesamplepacks",
                              email: "sapmike16@yahoo.com")
end

describe 'When I visit the logout path' do
   it "I am redirected back to the home page of the site" do

     visit '/login'

     fill_in :email, with: @user.email
     fill_in :password, with: "ilovesamplepacks"

     click_button 'Login'

     click_on 'Logout'

     expect(current_path).to eq('/')
     expect (page).to have_content("Login")
   end
 end
