require 'rails_helper'

describe 'Users' do
  let!(:user) { create(:user) }

  context 'new page' do
    scenario 'renders HTML in the /new template' do
      visit new_user_path
      expect(page).to have_content('Sign up')
    end

    scenario 'signup user' do
      visit new_user_path
      fill_in 'user_name', with: 'Jok'
      fill_in 'user_email', with: 'jok@example.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on 'Create my account'

      expect(page.current_path).to eq(page.current_path)
      expect(page).to have_css('p', text: 'Jok')
      expect(page).to have_css('p', text: 'jok@example.com')
    end
  end
end