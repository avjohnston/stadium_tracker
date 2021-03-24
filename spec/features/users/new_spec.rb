require 'rails_helper'

RSpec.describe 'New User Page', type: :feature do
  it 'has a form for name email, password and password confirmation' do
    visit new_user_path

    expect(page).to have_field(:name)
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
  end

  it 'can fill in a form with correct information and be taken to their dashboard' do
    visit new_user_path

    fill_in :name, with: "Andrew Johnston"
    fill_in :email, with: "andrew@email.com"
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_on 'Register'

    expect(page).to have_content("Welcome to your dashboard, Andrew Johnston!")
  end
end
