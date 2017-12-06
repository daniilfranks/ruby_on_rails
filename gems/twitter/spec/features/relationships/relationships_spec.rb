require 'rails_helper'

describe' Relationship' do
  let!(:user) { create(:user, name: 'Danila', email: 'danila_babanov@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user2) { create(:user, name: 'Jok', email: 'jok@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user3) { create(:user, name: 'Leo', email: 'leo@yahoo.com', admin: true, activated: true, activated_at: Time.zone.now) }
  let!(:user4) { create(:user, name: 'Zohan', email: 'zohan@zohan.com', admin: true, activated: true, activated_at: Time.zone.now) }

  before do 
    user.follow(user2)
    user.follow(user3)
    user2.follow(user)
    user3.follow(user)
  end

  scenario 'user profile page search links followers following' do
    login_user
    visit user_path(user)

    expect(page).to have_css('a', text: '2 following')
    expect(page).to have_css('a', text: '2 followers')
    
    #p page.text
    #p page.current_path
  end

  scenario 'following page' do
    login_user
    visit following_user_path(user)

    expect(page).to have_css('h3', text: 'Following')
  end

  scenario 'followers page' do
    login_user
    visit followers_user_path(user)

    expect(page).to have_css('h3', text: 'Followers')
  end

  scenario 'follow user' do
    login_user
    visit users_path

    page.all('a.user_link')[3].click
    
    expect(page).to have_button('Follow', visible: false)
    click_button 'Follow'
    expect(page).to have_button('Unfollow', visible: false)
  end

  scenario 'unfollow user' do
    login_user
    visit users_path

    page.all('a.user_link')[1].click
    
    expect(page).to have_button('Unfollow', visible: false)
    click_button 'Unfollow'
    expect(page).to have_button('Follow', visible: false)
  end
end
