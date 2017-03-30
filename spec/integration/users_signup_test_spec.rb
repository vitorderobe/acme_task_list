require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'example', 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')
  end

  scenario 'with blank name' do
    sign_up_with '', 'valid@example.com', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank email' do
    sign_up_with 'example', '', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_up_with 'example', 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  scenario 'with invalid email' do
    sign_up_with 'example', 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with password that has less than 6 chars' do
    sign_up_with 'example', 'valid@example.com', '12345'

    expect(page).to have_content('Log in')
  end

  def sign_up_with(name, email, password)
    visit new_user_registration_path
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_button 'Sign up'
  end
end
