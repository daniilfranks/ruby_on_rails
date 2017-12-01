require 'rails_helper'

describe 'Users' do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, name: 'Mamkin_Hacker', email: 'mh@example.com', password: '123456') }

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

    scenario 'Fail edit profile' do
      visit login_path
      
      fill_in 'user_email', with: 'danila_babanov@yahoo.com'
      fill_in 'user_password', with: '123456'

      click_on 'Log in'

      page.find('button.navbar-toggler').click
      page.find('a.nav-link', text: 'Account').click
      click_on 'Settings'

      expect(page).to have_css('h1', text: 'Update your profile')
      
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      click_on 'Save changes'

      expect(page.find('div.alert.alert-danger')).to have_content("The form contains 3 errors.")
    end

    scenario 'redirect edit when logged in as wrong user' do
      visit '/users/1/edit'
      expect(page.find('div.alert.alert-danger')).to have_content("Please log in.")
    end

    scenario 'redirect edit when logged in as wrong user' do
      visit login_path
      
      fill_in 'user_email', with: 'danila_babanov@yahoo.com'
      fill_in 'user_password', with: '123456'

      click_on 'Log in'

      visit '/users/2/edit'
      expect(page).to have_css('h1', text: 'Home')
    end

    scenario 'successful edit with friendly forwarding' do
      visit '/users/1/edit'
      
      expect(page.find('div.alert.alert-danger')).to have_content("Please log in.")

      fill_in 'user_email', with: 'danila_babanov@yahoo.com'
      fill_in 'user_password', with: '123456'

      click_on 'Log in'

      expect(page).to have_css('h1', text: 'Update your profile')
    end

    scenario 'redirect index when logged in as wrong user' do
      visit users_path
      expect(page.find('div.alert.alert-danger')).to have_content("Please log in.")
    end
  end
end
