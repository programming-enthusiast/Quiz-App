require 'rails_helper'

feature 'Homepage' do
  scenario 'User visits homepage' do
    visit root_path

    expect(page).to have_content 'Play Quizzes'
  end
end
