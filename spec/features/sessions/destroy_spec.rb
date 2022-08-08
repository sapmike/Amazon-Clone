require 'rails_helper'

RSpec.describe 'When I signout', type: :feature do
     it "I am redirected back to the home page of the site" do

     default_user = User.create(   first_name: "Michael",
                                last_name: "Sapienza",
                                email: "sapmike16@yahoo.com",
                                password: "ilovesamplepacks",
                                password_confirmation: "ilovesamplepacks")


     visit '/login'

     fill_in "Email", with: default_user.email
     fill_in "Password", with: default_user.password

     click_button "Login"

     visit '/'

     click_link "Log out"

     expect(current_path).to eq('/')
     expect(page).to have_content("Logged out successfully")
   end
 end
