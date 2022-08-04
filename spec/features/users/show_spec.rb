require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
  it 'should show me all of my user information in Account Settings' do
    default_user = User.create(    first_name: "Michael",
                                last_name: "Sapienza",
                                email: "sapmike16@yahoo.com",
                                password: "ilovesamplepacks",
                                password_confirmation: "ilovesamplepacks")
    visit '/'

    click_on "Login"

    fill_in "Email", with: default_user.email
    fill_in "Password", with: default_user.password

    click_button "Login"

    visit '/'

    click_on "Account Settings"


    expect(page).to have_content(default_user.email)
    expect(page).to have_content("Update Password")
    expect(page).to have_content("Delete Account")
  end
end

#tests are passing
