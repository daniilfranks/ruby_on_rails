require 'rails_helper'

describe 'Users' do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user2) { create(:user, name: 'Mamkin_Hacker', email: 'mh@example.com', password: '123456') }

  context 'new page' do
    scenario 'renders HTML in the /new template' do
      visit new_user_path
      expect(page).to have_content('Sign up')
    end

    scenario 'valid signup information' do
      visit signup_path
      
      fill_in 'user_name', with: 'Jok'
      fill_in 'user_email', with: 'jok@example.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on 'Create my account'

      expect(page).to have_css('h1', text: 'Home')
      expect(page.find('div.alert.alert-success')).to have_content("Please check your email to activate your account.")
    end

    scenario 'valid signup information with account activation' do
      visit edit_account_activation_path(user2.activation_token, email: user2.email)

      expect(page).to have_content('Account activated!')

      expect(page).to have_css('p', text: 'Mamkin_Hacker')
      expect(page).to have_css('p', text: 'mh@example.com')

      #p page.text
      #p page.current_path
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

    scenario 'redirect index when logged in as wrong user' do
      visit '/users'
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

    context 'Pagination' do
      before do 
        30.times { create(:user) }
      end

      scenario 'index including pagination' do
        visit login_path
      
        fill_in 'user_email', with: 'danila_babanov@yahoo.com'
        fill_in 'user_password', with: '123456'

        click_on 'Log in'

        visit users_path

        page.find('button.navbar-toggler').click
        page.find('a.nav-link', text: 'Users').click
        
        expect(page).to have_css('a.page-link', text: '1')
        expect(page).to have_css('a.page-link', text: '2')
        expect(page).to have_css('a.page-link', text: '3')
        expect(page).to have_css('a.page-link', text: '4')
        expect(page).to have_css('a.page-link', text: 'Next')
        expect(page).to have_css('a.page-link', text: 'Last')
      end

      scenario 'index as admin including pagination and delete links', js: true do
        visit login_path
      
        fill_in 'user_email', with: 'danila_babanov@yahoo.com'
        fill_in 'user_password', with: '123456'

        click_on 'Log in'

        page.find('a.nav-link', text: 'Users').click

        expect(user.admin).to eq(true)
        expect(page).to have_css('a', text: 'Delete')
        page.assert_selector('a', count: 9, text: 'Delete')
        expect(User.count).to eq(32)

        page.click_link('', href: '/users/3', text: 'Delete')
        
        page.driver.browser.accept_js_confirms do
          click_button 'OK'
        end

        expect(User.count).to eq(31)
      end

      scenario 'not delete links' do
        visit login_path
      
        fill_in 'user_email', with: 'mh@example.com'
        fill_in 'user_password', with: '123456'

        click_on 'Log in'

        page.find('button.navbar-toggler').click
        page.find('a.nav-link', text: 'Users').click

        expect(user2.admin).to eq(false)
        expect(page).not_to have_css('a', text: 'Delete')
        page.assert_selector('a', count: 0, text: 'Delete')
      end
    end
  end
end
