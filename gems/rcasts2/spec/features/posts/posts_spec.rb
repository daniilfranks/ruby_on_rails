require 'rails_helper'

describe 'Posts' do
  context 'Show page' do
    before do
      @post = create(:post)
    end

    scenario 'shows the title on the show page in an p tag' do
      visit post_path(@post)
      expect(page).to have_css('p', text: 'First post') 
    end

    scenario 'shows the description on the show page in a p tag' do
      visit post_path(@post)
      expect(page).to have_css('p', text: 'my text') 
    end
  end

  context 'index page' do
    before do
      @post = create(:post)
    end

    scenario 'links to show page' do
      visit posts_path
      expect(page).to have_link('Show', href: post_path(@post))
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
      fill_in 'post_title', with: 'My post'
      fill_in 'post_description', with: 'text text'

      click_on 'Create Post'

      expect(page.current_path).to eq(page.current_path)
      expect(page).to have_content('My post')
      expect(page).to have_content('text text')
    end
  end
end