require 'rails_helper'

feature 'User get to home page' do
  before :each do
    Capybara.current_driver = :selenium
    User.create(name: 'example', email: 'valid@example.com', password: 'password')
  end

  after :each do
    Capybara.use_default_driver
  end

  scenario 'home page links' do
    sign_in_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
    expect(page).to have_content('Users')
    expect(page).to have_content('Favorites')
    expect(page).to have_content('My Lists')
  end

  scenario 'user create new list', :js => true do
    sign_in_with 'valid@example.com', 'password'
    
    fill_in 'list[title]', with: "List 1"
    click_button('new-list-button')
    expect(page).to have_content('List 1')
  end

end
