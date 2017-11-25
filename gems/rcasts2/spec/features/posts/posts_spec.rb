require 'rails_helper'

describe 'Posts' do
  let!(:post) { create(:post) }
  let!(:category) { create(:category, name: 'ruby') }
  let!(:tag) { create(:tag, name: 'golang') }
  let!(:tag2) { create(:tag, name: 'elixir') }

  context 'Show page' do
    scenario 'shows the title on the show page in an p tag' do
      visit post_path(post)
      expect(page).to have_css('p', text: 'First post') 
    end

    scenario 'shows the description on the show page in a p tag' do
      visit post_path(post)
      expect(page).to have_css('p', text: 'my text') 
    end
  end

  context 'index page' do
    scenario 'links to show page' do
      visit posts_path
      expect(page).to have_link('Show', href: post_path(post))
    end

    scenario 'links to new post page' do
      visit posts_path
      expect(page).to have_link('New Post', href: new_post_path)
    end
  end

  context 'new page' do
    scenario 'renders HTML in the /new template' do
      visit new_post_path
      expect(page).to have_content('New Post')
    end

    scenario 'displays a new post form that redirects to the post page, which then contains the submitted posts title and description' do
      visit new_post_path
      fill_in 'post_title', with: 'Ruby on Rails'
      fill_in 'post_description', with: 'test test'

      click_on 'Create Post'

      expect(page.current_path).to eq(page.current_path)
      expect(page).to have_content('Ruby on Rails')
      expect(page).to have_content('test test')
    end
  end

  context 'category for post' do
    scenario 'can create a post with adding category' do
      visit '/posts/new'
      fill_in 'post_title', with: 'Category post'
      fill_in 'post_description', with: 'bla bla'
      choose 'ruby'
      click_button 'Create Post'

      expect(page).to have_content('Category post')
      expect(page).to have_content('bla bla')
      expect(page).to have_content('ruby')
    end

    scenario 'can create a post with adding one tag' do
      visit '/posts/new'
      fill_in 'post_title', with: 'Tag post'
      fill_in 'post_description', with: 'bla bla'
      check 'golang'
      click_button 'Create Post'

      expect(page).to have_content('Tag post')
      expect(page).to have_content('bla bla')
      expect(page).to have_content('golang')
    end

    scenario 'can create a post with adding multiple tags' do
      visit '/posts/new'
      fill_in 'post_title', with: 'Tag post'
      fill_in 'post_description', with: 'bla bla'
      check 'golang'
      check 'elixir'
      click_button 'Create Post'

      expect(page).to have_content('Tag post')
      expect(page).to have_content('bla bla')
      expect(page).to have_content('golang')
      expect(page).to have_content('elixir')
    end
  end
end