require 'rails_helper'

feature 'Categories' do
  given(:name) { Faker::Lorem.characters(number: 30) }
  given(:updated_name) { Faker::Lorem.characters(number: 30) }
  given(:admin) { create(:admin) }

  scenario 'Signed in admin manages categories' do
    login_as admin

    visit categories_path

    expect(page).to have_content 'Categories'

    # click_link 'new category'
    visit new_category_path

    expect(page).to have_content 'New category'

    fill_in 'Name', with: name
    click_button 'Create Category'

    expect(page).to have_content 'Category was successfully created'
    expect(page).to have_content name

    click_link 'Edit'

    expect(page).to have_content 'Editing Category'

    fill_in 'Name', with: updated_name
    click_button 'Update Category'

    expect(page).to have_content 'Category was successfully updated'
    expect(page).to have_content updated_name

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Category was successfully destroyed'
  end

  scenario 'Anonymous user manages categories' do
    visit categories_path

    expect(page).to have_content 'Access denied'
  end
end
