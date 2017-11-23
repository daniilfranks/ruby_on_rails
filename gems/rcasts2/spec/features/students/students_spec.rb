require 'rails_helper'

describe 'Students' do
  context 'Index page' do
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

  context 'new page' do
    before do
      @student = create(:student)
    end

    scenario 'renders HTML in the /new template' do
      visit new_student_path
      expect(page).to have_content('New Student')
    end

    scenario 'displays a new student form that redirects to the student page, which then contains the submitted students f_name and l_name' do
      visit new_student_path
      fill_in 'student_f_name', with: 'Den'
      fill_in 'student_l_name', with: 'Babanov'

      click_on 'Create Student'

      expect(page).to have_content('Den')
      expect(page).to have_content('Babanov')
    end

    scenario 'shows a new form that submits content and redirects and prints out params' do
      visit edit_student_path(@student)

      fill_in 'student_f_name', with: 'New f name'
      fill_in 'student_l_name', with: 'New l name'
      click_on 'Update Student'

      expect(page).to have_content('New f name')
      expect(page).to have_content('New l name')
    end
  end
end