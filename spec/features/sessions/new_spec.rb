require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @user = User.create(        first_name: "Michael",
                                last_name: "Sapienza",
                                email: "sapmike16@yahoo.com",
                                password: "ilovesamplepacks",
                                password_confirmation: "ilovesamplepacks")
  end

  describe 'When I visit the login path' do
    it 'I see a field to enter my email address and password' do
      visit '/login'

      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end
  end

  describe 'When I submit valid information' do
  it 'If I am a regular user, I am redirected to the home page and I see home page with my cart' do
    visit '/login'

    fill_in "Email", with: @user.email
    fill_in "Password", with: "ilovesamplepacks"

    click_button 'Login'

    expect(current_path).to eq('/')
    expect(page).to have_content("My Cart")
  end


  describe 'when I submit invalid information' do
    it 'Then I am redirected to the login page again to enter valid infomration' do
      visit '/login'

      fill_in "Email", with: @user.email
      fill_in "Password", with: "samplepackssuck"

      click_button 'Login'

      expect(current_path).to eq('/login')

      fill_in "Email", with: "sapnick2022@yahoo.com"
      fill_in "Password", with: "ilovesamplepacks"

      click_button 'Login'

      expect(current_path).to eq('/login')
      end
    end
  end
end

#finished
