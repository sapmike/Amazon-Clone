require 'rails_helper'

RSpec.describe "Users", type: :request do

  get signup_path

  post signup_path, user: {first_name: 'Michael', last_name: 'Sapienza', email: 'sapmike16@yahoo.com', password: 'helloworld'}
  expect(response.body).to include 'Account successfully created'
end 
