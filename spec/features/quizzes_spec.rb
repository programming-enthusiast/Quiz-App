require 'rails_helper'

feature 'Quizzes' do
  given(:category_name) { Faker::Lorem.characters(number: 30) }
  given(:user) { create(:user) }

  given(:title) { Faker::Lorem.characters(number: 30) }
  given(:updated_title) { Faker::Lorem.characters(number: 30) }

  background do
    create(:category, name: category_name)
  end

  scenario 'Signed in user manages quizzes' do
    login_as user

    visit quizzes_path

    expect(page).to have_content 'Quizzes'

    # click_link 'new quiz'
    visit new_quiz_path

    expect(page).to have_content 'New quiz'

    select(category_name)
    fill_in 'Title', with: title
    click_button 'Create Quiz'

    expect(page).to have_content 'Quiz was successfully created'
    expect(page).to have_content title

    click_link 'Edit'

    expect(page).to have_content 'Editing Quiz'
    fill_in 'Title', with: updated_title
    click_button 'Update Quiz'

    expect(page).to have_content 'Quiz was successfully updated'
    expect(page).to have_content updated_title

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Quiz was successfully destroyed'
  end

  scenario 'Anonymous user manages quizzes' do
    visit quizzes_path

    expect(page).to have_content 'You need to sign in'
  end
end
