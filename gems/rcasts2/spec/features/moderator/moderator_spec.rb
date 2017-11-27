require 'rails_helper'

describe 'Moderator' do
  context 'index page' do
    scenario 'shows the title on the moderator page in an h1 tag' do
      visit '/moderator'

      expect(page).to have_css('h1', 'Dashboard') 
      expect(page).to have_css('h1', 'Index page')
    end
  end

  context 'users page' do
    scenario 'shows the title on the moderator users page in an h1 tag' do
      visit '/moderator/users'

      expect(page).to have_css('h1', 'Dashboard') 
      expect(page).to have_css('h1', 'Users')
    end
  end
end