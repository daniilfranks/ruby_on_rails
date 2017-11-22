require 'rails_helper'

describe 'Students' do
  context 'Multiple students are shown' do
    before(:all) do
      create(:student)
      create(:student, f_name: 'Leo', l_name: 'Barboza')
    end

    scenario 'on the index page 'do
      visit '/students'

      expect(page).to have_content(/Den|Babanov/)
      expect(page).to have_content(/Leo|Barboza/)
    end
  end

  context 'Show page' do
    before(:all) do
      @student = create(:student)
    end

    scenario 'renders the first name in a h1 tag' do
      visit "students/#{@student.id}"
      expect(page).to have_css('h1', text: 'Den')
    end

    scenario 'renders the last name in a p tag' do
      visit "students/#{@student.id}"
      expect(page).to have_css('p', text: 'Babanov')
    end
  end
end