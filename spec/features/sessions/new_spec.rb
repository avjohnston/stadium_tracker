require 'rails_helper'

RSpec.describe 'Sessions New Page', type: :feature do
  before :each do
    @user = User.create!(name: 'Andrew Johnston', email: 'andrewwww@email.com', password: 'password')
  end

  it 'login page has fields for email and password' do
    visit login_path

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
  end

  it 'login page when enter correct information takes you to your dashboard' do
    visit login_path

    fill_in :email, with: 'andrewwww@email.com'
    fill_in :password, with: @user.password
    click_on 'Login'

    expect(page).to have_content("Welcome to your dashboard, Andrew Johnston!")
  end
end
