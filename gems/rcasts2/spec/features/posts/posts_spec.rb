require 'rails_helper'

describe 'Posts' do
  context 'Multiple students are shown' do
    before(:all) do
      @post = create(:post)
    end

    scenario 'shows the title on the show page in an p tag' do
      visit "/posts/#{@post.id}"
      expect(page).to have_css('p', text: 'First post') 
    end

    scenario 'shows the description on the show page in a p tag' do
      visit "/posts/#{@post.id}"
      expect(page).to have_css('p', text: 'my text') 
    end
  end
end