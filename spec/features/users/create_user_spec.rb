require 'rails_helper'

RSpec.describe 'Creating a new user', type: :feature do
  it "should be able to create a new user through signing up" do
    visit '/'

    within(".topnav") do
      click_on "Signup"
    end

    expect(current_path).to eq('signup')
    expect(page).to have_content("Sign up")

    fill_in :first_name, with: "Michael"
    fill_in :last_name, with: "Sapienza"
    fill_in :email, with: "ilovesamplepacks@email.com"
    fill_in :password, with: "samplepacksrule"

    click_on "Create an account"

    expect(current_path).to eq("/")
    expect(page).to have_content("2022 Melody Collection")
  end
end
