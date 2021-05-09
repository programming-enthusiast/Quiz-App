require 'rails_helper'

feature 'Sign in process' do
  given(:password) { Faker::Internet.password }
  given(:user) { create(:user, password: password) }

  scenario 'User signs in with valid credentials' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'User signs in with invalid email' do
    visit new_user_session_path

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: password
    click_button 'Log in'

    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'User signs in with invalid password' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: Faker::Internet.password
    click_button 'Log in'

    expect(page).to have_content 'Invalid Email or password'
  end
end
