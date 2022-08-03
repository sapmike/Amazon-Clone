require 'rails_helper'

RSpec.describe 'Creating a new user', type: :feature do
  it "should be able to create a new user through signing up" do

    visit '/'

    click_on "Signup"


    expect(current_path).to eq('/signup')
    expect(page).to have_content("Sign up")

    fill_in "First Name", with: "Michael"
    fill_in "Last Name", with: "Sapienza"
    fill_in "Email", with: "ilovesamplepacks@email.com"
    fill_in "Password", with: "samplepacksrule"

    click_on "Create an account"

    expect(current_path).to eq('/')
    expect(page).to have_content("Account successfully created")
  end

  it "displays flash message error and returns to signup form if any fields empty" do

    visit '/signup'

    fill_in "First Name", with: "Michael"
    fill_in "Last Name", with: ""
    fill_in "Email", with: "ilovesamplepacks@email.com"
    fill_in "Password", with: "samplepacksrule"

    click_on "Create an account"

    expect(current_path).to eq('/signup')
    expect(page).to have_content("Invalid data in one or more fields")
  end
end

#tests are passing 
