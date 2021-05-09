require 'rails_helper'

feature 'Questions' do
  given(:category_name) { Faker::Lorem.characters(number: 30) }
  given(:user) { create(:user) }
  given(:quiz) { create(:quiz, user: user) }

  given(:text) { Faker::Lorem.characters(number: 30) }
  given(:updated_text) { Faker::Lorem.characters(number: 30) }

  background do
    create(:category, name: category_name)
  end

  scenario 'Signed in user manages questions' do
    login_as user

    visit quiz_questions_path(quiz)

    expect(page).to have_content 'Questions'

    # click_link 'new question'
    visit new_quiz_question_path(quiz)

    expect(page).to have_content 'New Question'

    fill_in 'Text', with: text
    click_button 'Create Question'

    expect(page).to have_content 'Question was successfully created'
    expect(page).to have_content text

    click_link text

    click_link 'Edit'

    expect(page).to have_content 'Editing Question'
    fill_in 'Text', with: updated_text
    click_button 'Update Question'

    expect(page).to have_content 'Question was successfully updated'
    expect(page).to have_content updated_text

    click_link updated_text

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Question was successfully destroyed'
  end

  scenario 'Anonymous user manages questions' do
    visit quiz_questions_path(quiz)

    expect(page).to have_content 'You need to sign in'
  end
end
