require 'rails_helper'

feature 'Answers' do
  given(:category_name) { Faker::Lorem.characters(number: 30) }
  given(:user) { create(:user) }
  given(:quiz) { create(:quiz, user: user) }
  given(:question) { create(:question, quiz: quiz) }

  given(:text) { Faker::Lorem.characters(number: 30) }
  given(:updated_text) { Faker::Lorem.characters(number: 30) }

  background do
    create(:category, name: category_name)
  end

  scenario 'Signed in user manages answers' do
    login_as user

    visit quiz_question_answers_path(quiz, question)

    expect(page).to have_content 'Answers'

    # click_link 'new answer'
    visit new_quiz_question_answer_path(quiz, question)

    expect(page).to have_content 'New Answer'

    fill_in 'Text', with: text
    click_button 'Create Answer'

    expect(page).to have_content 'Answer was successfully created'
    expect(page).to have_content text

    click_link text

    click_link 'Edit'

    expect(page).to have_content 'Editing Answer'
    fill_in 'Text', with: updated_text
    click_button 'Update Answer'

    expect(page).to have_content 'Answer was successfully updated'
    expect(page).to have_content updated_text

    click_link updated_text

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Answer was successfully destroyed'
  end

  scenario 'Anonymous user manages answers' do
    visit quiz_question_answers_path(quiz, question)

    expect(page).to have_content 'You need to sign in'
  end
end
