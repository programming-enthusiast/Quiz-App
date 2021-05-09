require 'rails_helper'

feature 'Sign up process' do
  given(:email) { Faker::Internet.email }
  given(:password) { Faker::Internet.password }

  given(:invalid_email) { 'email' }
  given(:invalid_password) { 'pass' }

  scenario 'User signs up with valid credentials' do
    visit new_user_registration_path

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'

    expect(page).to have_content 'You have signed up successfully'
  end

  scenario 'User signs up with invalid email' do
    visit new_user_registration_path

    fill_in 'Email', with: invalid_email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'

    expect(page).to have_content 'Sign up'
  end

  scenario 'User signs with invalid password' do
    visit new_user_registration_path

    fill_in 'Email', with: email
    fill_in 'Password', with: invalid_email
    fill_in 'Password confirmation', with: invalid_email
    click_button 'Sign up'

    expect(page).to have_content 'Password is too short'
  end

  scenario 'User signs up with invalid password confirmation' do
    visit new_user_registration_path

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: invalid_password
    click_button 'Sign up'

    expect(page).to have_content "Password confirmation doesn't match"
  end
end
