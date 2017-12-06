require 'rails_helper'

describe 'Microposts' do
  context 'pagination' do
    let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
    before do
      20.times { create(:user, activated: true, activated_at: Time.zone.now) }
      users = User.all
      users.each { |user| 20.times { create(:micropost, user_id: user.id) } }
    end

    scenario 'profile display' do
      login_user

      expect(page).to have_css('p', text: 'Danila')
      expect(page).to have_css('p', text: 'danila_babanov@yahoo.com')
      expect(page).to have_css('img.gravatar')

      expect(page).to have_css('h3', text: 'Microposts (20)')
      expect(page).to have_css('a.page-link', text: '1')
      expect(page).to have_css('a.page-link', text: '2')
      expect(page).to have_css('a.page-link', text: 'Next')
      expect(page).to have_css('a.page-link', text: 'Last')
      page.assert_selector('a', count: 10, text: 'delete')
    end

    scenario 'home page login' do
      login_user
      visit root_path

      expect(page).to have_css('h1', text: 'Home')
      expect(page).to have_css('h1', text: 'Danila')
      expect(page).to have_link('', href: '/users/1', text: 'view my profile')

      expect(page).to have_css('h3', text: 'Micropost Feed')
      expect(page).to have_css('a.page-link', text: '1')
      expect(page).to have_css('a.page-link', text: '2')
      expect(page).to have_css('a.page-link', text: 'Next')
      expect(page).to have_css('a.page-link', text: 'Last')
      page.assert_selector('a', count: 10, text: 'delete')
    end


    scenario 'destroy micropost profile page', js: true do
      login_user
      
      expect(page).to have_css('h3', text: 'Microposts (20)')
      
      #page.first('a', text: 'delete').click
      page.all('a', text: 'delete')[3].click
        
      page.driver.browser.accept_js_confirms do
        click_button 'OK'
      end

      expect(page).to have_css('h3', text: 'Microposts (19)')
    end

    scenario 'destroy micropost home page', js: true do
      login_user
      visit root_path

      expect(user.microposts.count).to eq(20)
      
      page.all('a', text: 'delete')[3].click
        
      page.driver.browser.accept_js_confirms do
        click_button 'OK'
      end

      expect(user.microposts.count).to eq(19)
    end

    scenario 'create micropost' do
      login_user
      visit root_path

      expect(user.microposts.count).to eq(20)
      
      fill_in 'micropost_content', with: 'My first post.'
      click_on 'Post'

      expect(page).to have_css('span.content', text: 'My first post.')
      expect(user.microposts.count).to eq(21)
    end
  end
end
