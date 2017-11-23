require 'rails_helper'

describe 'Posts' do
  context 'Multiple students are shown' do
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
    before(:all) do
      @post = create(:post)
    end

    scenario 'links to post page' do
      visit posts_path
      expect(page).to have_link('Show', href: post_path(@post))
    end
  end
end