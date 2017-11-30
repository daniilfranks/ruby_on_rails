require 'rails_helper'

describe 'Users' do
  let!(:user) { create(:user) }

  context 'new page' do
    scenario 'renders HTML in the /new template' do
      visit new_user_path
      expect(page).to have_content('Sign up')
    end

    scenario 'signup user' do
      visit signup_path
      
      fill_in 'user_name', with: 'Jok'
      fill_in 'user_email', with: 'jok@example.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on 'Create my account'

      expect(page).to have_css('p', text: 'Jok')
      expect(page).to have_css('p', text: 'jok@example.com')
    end

    scenario 'login user' do
      visit login_path
      
      fill_in 'user_email', with: 'danila_babanov@yahoo.com'
      fill_in 'user_password', with: '123456'

      click_on 'Log in'

      expect(page.current_path).to eq(page.current_path)
      expect(page).to have_link('Profile', visible: false)
      expect(page).to have_link('Settings', visible: false)
      expect(page).to have_link('Logout', visible: false)
    end

    scenario 'logout user' do
      visit login_path
      
      fill_in 'user_email', with: 'danila_babanov@yahoo.com'
      fill_in 'user_password', with: '123456'

      click_on 'Log in'

      expect(page).to have_link('Profile', visible: false)
      expect(page).to have_link('Settings', visible: false)
      expect(page).to have_link('Logout', visible: false)

      page.find('button.navbar-toggler').click
      page.find('a.nav-link', text: 'Account').click

      click_on 'Logout'
      expect(page).to have_link('Login', visible: false)
    end
  end
end