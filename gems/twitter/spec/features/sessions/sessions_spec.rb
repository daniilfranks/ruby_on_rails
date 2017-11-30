require 'rails_helper'

describe 'Session' do
  let!(:user) { create(:user) }

  context 'login page' do
    scenario 'renders HTML in the /login template' do
      visit login_path
      expect(page).to have_content('Log in')
    end

    scenario 'login with invalid information' do
      visit login_path

      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''

      click_on 'Log in'

      expect(page.find('div.alert.alert-danger')).to have_content('Invalid email/password combination')
      visit root_path
      expect(page).not_to have_css('div.alert.alert-danger', text: 'Invalid email/password combination')
    end
  end
end
