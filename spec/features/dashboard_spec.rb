require 'rails_helper'

feature 'Dashboard' do
  given(:user) { create(:user) }

  scenario 'Signed in user visits dashboard' do
    login_as user

    visit dashboard_path

    expect(page).to have_content 'Create a new quiz'
  end

  scenario 'Anonymous user visits dashboard' do
    visit dashboard_path

    expect(page).to have_content 'You need to sign in'
  end
end
