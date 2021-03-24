require 'rails_helper'

RSpec.describe 'Welcome index page', type: :feature do
  it 'has application name and description' do
    visit root_path

    app_welcome = "Welcome To Stadium Tracker!"
    app_description = "A place to store and track your trips around the 30 Major League Ballparks!"

    expect(page).to have_content(app_welcome)
    expect(page).to have_content(app_description)
  end

  it 'has a link to login' do
    visit root_path

    expect(page).to have_link("Login")
    click_link "Login"
    expect(current_path).to eq(login_path)
  end

  it 'has a link to login' do
    visit root_path

    expect(page).to have_link("Register Here")
    click_link "Register Here"
    expect(current_path).to eq(new_user_path)
  end
end
