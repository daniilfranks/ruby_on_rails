require 'rails_helper'

describe 'Students' do
  context 'Multiple students are shown' do
    before do
      @student = create(:student)
      create(:student, f_name: 'Leo', l_name: 'Barboza')
    end

    scenario 'on the index page 'do
      visit students_path

      expect(page).to have_content(/Den|Babanov/)
      expect(page).to have_content(/Leo|Barboza/)
    end

    scenario 'links to student page' do
      visit students_path
      expect(page).to have_link('Show', href: student_path(@student))
    end
  end

  context 'Show page' do
    before do
      @student = create(:student)
    end

    scenario 'renders the first name in a h1 tag' do
      visit student_path(@student)
      expect(page).to have_css('h1', text: 'Den')
    end

    scenario 'renders the last name in a p tag' do
      visit student_path(@student)
      expect(page).to have_css('p', text: 'Babanov')
    end

    scenario 'renders the active in a p tag' do
      visit student_path(@student)
      expect(page).to have_css('p', text: 'This student is currently inactive.')
    end
  end

  context 'Activate page' do
    before do
      @student = create(:student)
    end
    
    scenario 'Should mark an inactive stuent as active' do
      visit activate_student_path(@student)
      @student.reload
      expect(@student.active).to eq(true)
    end

    scenario "Should mark an active student as inactive" do
      @student.active = true
      @student.save

      visit activate_student_path(@student)
      @student.reload

      expect(@student.active).to eq(false)
    end

    scenario 'activate page links' do
      visit student_path(@student)

      expect(page).to have_link('Activate', href: activate_student_path(@student))
    end

    scenario 'index page links' do
      visit student_path(@student)

      expect(page).to have_link('Back', href: students_path)
    end
  end
end