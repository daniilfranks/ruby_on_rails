require 'rails_helper'

describe 'Admin' do
  context 'index page' do
    scenario 'shows the title on the admin page in an h1 tag' do
      visit '/admin'

      expect(page).to have_css('h1', 'Dashboard') 
      expect(page).to have_css('h1', 'Index page')
    end
  end

  context 'users page' do
    scenario 'shows the title on the admin users page in an h1 tag' do
      visit '/admin/users'

      expect(page).to have_css('h1', 'Dashboard') 
      expect(page).to have_css('h1', 'Users')
    end
  end
end