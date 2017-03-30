module Features
  module SessionHelpers  
    
    def sign_in_with(email, password)
      visit new_user_session_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Log in'
    end
  end
end